require_relative '../../common'

Given('an api for to perform a get request') do
  puts "Starting the execution of step"
  url = "https://dummy.restapiexample.com/api/v1/employees"
  response = Api.new.getMethod(url)
  responseBody = JSON.parse(response.body)
  puts "Response : #{responseBody}"
  puts "Completion of the step"
  puts "---------------------------------------------------"
end