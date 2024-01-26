require 'net/http'
require 'uri'


class Api

  def getMethod(base_url)
    url = URI.parse(base_url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == 'https')
    http.use_ssl = (url.scheme == 'https')
    request = Net::HTTP::Get.new(url.path)

    # Perform additional configuration if needed, such as headers or query parameters
    # request['Header-Name'] = 'header-value'
    # request.set_form_data('param1' => 'value1', 'param2' => 'value2')

    # Perform the request and print the response
    response = http.request(request)

    if response.is_a?(Net::HTTPSuccess)
      puts "Response Code: #{response.code}"
      puts "Response Body: #{response.body}"
    else
      puts "Request failed with status code: #{response.code}"
      puts "Response Body: #{response.body}"
    end

    return response
  end

end
