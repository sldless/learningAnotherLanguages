require "uri"
require "net/http"
require "json"
getjson = JSON.parse(Net::HTTP.get(URI('https://v2.jokeapi.dev/joke/Any?safe-mode')))
puts getjson['setup']
puts "Guess:"
user_input = gets.chomp
if (!user_input.empty? == false) 
  puts "You didn't even guess but the answer is\n#{getjson['delivery']}"
else
  if user_input == getjson['delivery']
    puts "Correct, #{getjson['delivery']}"
  else
    puts "Wrong the correct answer is\n#{getjson['delivery']}"
  end
end
