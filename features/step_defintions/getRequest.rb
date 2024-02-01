require_relative '../../common'

Given('an api for to perform a get request') do
  puts "Starting the execution of step"
  url = "https://reqres.in/api/users?page=2"
  response = Api.new.getMethod(url)
  responseBody = JSON.parse(response.body)
  puts "Response : #{responseBody}"
  puts "Completion of the step"
  puts "---------------------------------------------------"
end
