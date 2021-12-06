require "uri"
require "net/http"
require "json"
requestcurrentip = Net::HTTP.get(URI("https://api.ipify.org/?format=json"))
puts "Enter an ip address or press enter to use your own."
user_input = gets.chomp
if (!user_input.empty?) 
  getip = user_input
else
  getip = JSON.parse(requestcurrentip)["ip"] 
end

countryfromip = Net::HTTP.get(URI("http://ip-api.com/json/#{getip}"))
getinfo = JSON.parse(countryfromip)
if getinfo["status"] == 'fail'
  puts "Failed to get info"
  return
end
puts "Infomation from your ip"
puts "Country: #{getinfo["country"]}"
puts "Region: #{getinfo["regionName"]}"
puts "City: #{getinfo['city']}"
puts "Postal code: #{getinfo['zip']}"
puts "Timezone: #{getinfo["timezone"]}"
puts "ISP: #{getinfo["isp"]}"
puts "ORG: #{getinfo["org"]}"
