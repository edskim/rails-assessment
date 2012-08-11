
require 'rest-client'
require 'json'

class CustomerClient

  def initialize(server)
    @server = server
  end

  def parse_response(resp)
    JSON.parse(resp, symbolize_names: true)
  end

  def new_customer(first_name, last_name)
    resp = RestClient.post("#{@server}/customers.json", 
                              customer: { first_name: first_name, last_name: last_name })
    customer = parse_response(resp)
  end

  def list_all_customers
    resp = RestClient.get("#{@server}/customers.json")
    customers = parse_response(resp)
  end

end

puts "Enter the server location (e.g. http://localhost:3000):"
server = gets.chomp
customer = CustomerClient.new(server)
resp=""

while(!resp.equal?("q"))
  puts "Enter 1 to create a new customer"
  puts "Enter 2 to list all customers"
  puts "Enter q to quit"
  resp = gets.chomp

  case resp
  when 1.to_s
    puts "Please enter the customer's first name"
    first_name = gets.chomp
    puts "Please enter the customer's last name"
    last_name = gets.chomp
    newCustomer = customer.new_customer(first_name, last_name)
    puts "New customer created: #{newCustomer}"
  when 2.to_s
    customers = customer.list_all_customers
    puts "Here is a list of all the customers:\n#{customers}"
  when "q"
    break
  else
    puts "Invalid entry. Please try again"
  end
end
