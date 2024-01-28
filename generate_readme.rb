require_relative "lib/mtn_open_api"

def get_sample_method(paths, method_name = "post")
  post = nil

  paths.each do |path, methods|
    methods.each do |http_method, details|
      if http_method === method_name
        post = details
        break # This breaks out of the inner loop when a method_name method is found
      end
    end

    break if post # This breaks out of the outer loop when a method_name method is found
  end

  post
end

def arr_to_h(arr)
  arr.to_h {|key| [key, "string"]}
end

def api_docs
  output = ""

  MtnOpenApi.schemas.each do |schema|
    namespace = schema[:namespace]
    content = schema[:content]
    paths = content['paths']
    info = content["info"]
    api = schema[:api]

    default_base_url = content["servers"].first['url']
    instance_name = namespace.downcase
    module_name = "MtnOpenApi"

    # Get sample request
    sample_method = get_sample_method(paths) || get_sample_method(paths, "get")
    # Sample parameters
    sample_parameters = sample_method["parameters"]
    sample_headers = sample_parameters.select { |p| p["in"] === 'header' }.map { |p| p["name"]}
    sample_body = sample_method["requestBody"]["content"]
    sample_json = sample_body["application/json"]
    sample_urlencoded = sample_body["application/x-www-form-urlencoded"]
    # Formatting params with application/x-www-form-urlencoded as string
    params_prefix_surfix = "#{!sample_json ? '"': ""}"

    # Headers
    sample_common_headers = ["Authorization", "X-Callback-Url", "X-Target-Environment", "Ocp-Apim-Subscription-Key"]
    formatted_common_headers = JSON.pretty_generate(arr_to_h(sample_common_headers))
    extra_headers = sample_headers - sample_common_headers

    # Formattig document
    # Class documenting
    output += "## #{module_name}::#{namespace}\n"
    output += "#{info["description"]}\n\n"
    output += "This class provides a convenient interface for making requests to the MTN MoMo `#{api}` API.\n"
    output += "#### Initialization\n"
    output += "You can initialize it with the following parameters:\n"
    output +="
- `base_url` (optional): The base URL for the MTN MoMo `#{api}` API. If not provided, the default value is #{default_base_url}.
- `headers` (optional): A hash of HTTP headers to be included in the API requests.
- `schema` (optional): A hash representing the API schema. If not provided, the gem will use the default schema, which is already included in the gem. You can also download the schema from [https://momodeveloper.mtn.com/API-collections#api=#{api}](https://momodeveloper.mtn.com/API-collections#api=#{api}).
    "

    output += "\n#### Example
```ruby
common_headers = #{formatted_common_headers}

#{instance_name} = MtnOpenApi::#{namespace}.new(
  headers: common_headers
)

params = #{params_prefix_surfix}#{ sample_json ? JSON.pretty_generate(sample_json['example']) : sample_urlencoded['example'] }#{params_prefix_surfix}

extra_headers = #{JSON.send(extra_headers.size > 0 ? :pretty_generate : :dump, arr_to_h(sample_headers - sample_common_headers))}

response = #{instance_name}.#{MtnOpenApi.to_camel_case(sample_method['operationId'])}(params, extra_headers)
```"

    output += "\n"
    output += "#### Methods\n"

    paths.each do |path, methods|
      methods.each do |http_method, details|
        method_name = MtnOpenApi.to_camel_case(details['operationId'])
        output += "- [#{method_name}](https://momodeveloper.mtn.com/API-collections#api=#{api}&operation=#{details['operationId']})"
        output += " #{details['description']}"
        output += "\n"
      end
    end

    output += "\n"
  end

  output
end

readme_content = File.read('readme-template')

# Replace "TODO: Write usage instructions here"
new_content = readme_content.gsub('TODO: Write usage instructions here', api_docs)

# Write the modified content back to the README file
File.write("README.md", new_content)

puts 'README file updated successfully!'
