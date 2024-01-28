require 'mtn_open_api'
require 'active_support/all'

RSpec.describe MtnOpenApi do
  MtnOpenApi.schemas.each do |schema|
    class_name = "MtnOpenApi::#{schema[:namespace]}"
    content = schema[:content]

    describe schema[:namespace] do
      it "is defined" do
        expect(defined?(class_name.constantize)).to be_truthy
      end

      subject { class_name.constantize.new(schema: content) }

      it "should have base_url" do
        expect(subject.base_url).to be_a(URI)
      end

      content['paths'].each do |path, methods|
        methods.each do |http_method, details|
          method_name = MtnOpenApi.to_camel_case(details['operationId']).to_sym
          required = details["parameters"].select { |p| p["required"] }

          describe method_name do
            it "is defined" do
              expect(subject.respond_to?(method_name)).to be_truthy
            end

            it "should raise if required params are missing" do
              required_params = required.map { |p| p["name"]}

              unless required_params.blank?
                begin
                  subject.public_send(method_name)
                rescue ArgumentError => e
                  expect(required_params.any? { |param| e.message.include?(param) }).to be_truthy
                end
              end
            end

            it "should be able to perform a request" do
              headers = {}
              params = {}

              required_headers = required.select { |p| p["in"] === 'header' }.map { |p| p["name"]}
              required_params = required.select { |p| p["in"] != 'header' }.map { |p| p["name"]}

              required_headers.each_with_index do |key, index|
                headers[key] = "value-#{index}"
              end

              required_params.each_with_index do |key, index|
                params[key] = "value-#{index}"
              end

              response = subject.public_send(method_name, params, headers)
              expect(response['statusCode']).to eq(401)
              expect(response['message']).to include("Access denied due to missing subscription key.")
            end
          end
        end
      end
    end
  end
end
