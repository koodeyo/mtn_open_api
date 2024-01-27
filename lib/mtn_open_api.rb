# frozen_string_literal: true

require "yaml"
require 'json'
require 'net/http'
require 'uri'
require 'json-schema'
require_relative "mtn_open_api/version"

module MtnOpenApi
  class Error < StandardError; end

  def self.to_camel_case(operationId)
    # AbCd to ab_cd
    operationId = operationId.gsub(/\W/, '_').gsub(/([a-z])([A-Z])/, '\1_\2').downcase
    # _ -
    words = operationId.split(/[_-]/)
    camel_case_words = words.map.with_index { |w, i| i.zero? ? w : w.capitalize }
    camel_case_words.join
  end

  def self.schemas
    [
      {
        namespace: 'Collection',
        content: MtnOpenApi.load_schema("collection")
      },
      {
        namespace: "Disbursement",
        content: MtnOpenApi.load_schema("disbursement")
      },
      {
        namespace: "Remittance",
        content: MtnOpenApi.load_schema("remittance")
      },
      {
        namespace: "SandboxProvisioningApi",
        content: MtnOpenApi.load_schema("sandbox-provisioning-api")
      }
    ]
  end

  def self.load_schema(filename)
    YAML.load(File.read("schemas/#{filename}.yaml"))
  rescue
  end

  # Dynamically define classes based on schemas
  schemas.each do |schema|
    class_name = schema[:namespace]
    content = schema[:content]
    next if content.nil?

    default_base_url = content["servers"].first['url']

    class_content = Class.new do
      attr_reader :base_url, :common_headers

      define_method(:initialize) do |schema: content, base_url: default_base_url, common_headers: {}|
        @base_url = URI.parse(base_url)
        @common_headers = common_headers

        # Define methods
        define_methods(content)
      end

      private

      def define_methods(schema)
        schema['paths'].each do |path, methods|
          methods.each do |http_method, details|
            operationId = details['operationId'] || "#{http_method} #{path}"
            # Remove non-word characters (including "-") and convert to camel case
            method_name = MtnOpenApi.to_camel_case(operationId)
            define_singleton_method(method_name) do |params: {}, headers: {}|
              headers = common_headers.merge(headers)
              validate_parameters(http_method, path, headers, params, details)
              make_request(http_method, path, headers, params)
            end
          end
        end
      end

      def validate_parameters(http_method, path, headers, params, operation_details)
        # Validate required headers
        required_headers = operation_details['parameters'].select { |param| param['in'] == 'header' && param['required'] }
        validate_required_parameters(headers, required_headers)

        # Validate required path parameters
        path_params = path.scan(/{(\w+)}/).flatten
        required_path_params = operation_details['parameters'].select { |param| param['in'] == 'path' && path_params.include?(param['name']) && param['required'] }
        validate_required_parameters(params, required_path_params)

        # Validate required query parameters
        required_query_params = operation_details['parameters'].select { |param| param['in'] == 'query' && param['required'] }
        validate_required_parameters(params, required_query_params)
      end

      def validate_required_parameters(data, schema)
        schema.each do |param_schema|
          param_name = param_schema['name']
          # Check if the parameter is present in the data
          unless data.key?(param_name)
            raise ArgumentError, "Missing required parameter: #{param_name}"
          end

          # Validate the parameter against the schema
          JSON::Validator.validate!(param_schema['schema'], data[param_name])
        end
      end

      def make_request(http_method, path, headers, params)
        url = "#{base_url}#{replace_path_variables(path, params)}"
        uri = URI.parse(url.to_s)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == 'https')

        request = case http_method.downcase
                  when 'get'
                    uri.query = URI.encode_www_form(params)
                    Net::HTTP::Get.new(uri.request_uri)
                  when 'post'
                    Net::HTTP::Post.new(uri.request_uri)
                  when 'put'
                    Net::HTTP::Put.new(uri.request_uri)
                  when 'delete'
                    Net::HTTP::Delete.new(uri.request_uri)
                  # Add other HTTP methods as needed
                  else
                    raise "Unsupported HTTP method: #{http_method}"
                  end

        # Set headers
        headers.merge(
          'Content-Type' => 'application/json'
        ).each { |key, value| request[key] = value }

        # Set request body for 'POST' and 'PUT'
        request.body = params.to_json if %w[post put].include?(http_method.downcase)

        # Make the request
        response = http.request(request)

        begin
          JSON.parse(response.body)
        rescue
          { "statusCode" => response.code.to_i, "message" => response.body }
        end
      end

      def replace_path_variables(path, params)
        path.gsub(/{([^{}]+)}/) { params[$1] }
      end
    end

    const_set(class_name, class_content)
  end
end
