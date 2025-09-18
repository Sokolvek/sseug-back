require 'sinatra'
require 'telegram/bot'

# disable :protection
# use Rack::Protection, :host_authorization => false
# use Rack::Protection, except: [:all]
disable :protection
configure do
  disable :protection
end
token = "token"
chat_id = 1407232708
bot = Telegram::Bot::Client.new(token)
Thread.new do
  bot.listen do |msg|
      case msg.text
      when "t"
        puts msg.chat.id, msg.text
      end
  end
end

post "/" do
  session.clear
  data = JSON.parse request.body.read
  msg = "Студент (#{data['username']}) не сможет прийти на пару \n подробности: #{data['desc']}"
  bot.api.send_message(chat_id: chat_id, text: msg) 
  "done"
end

get "/" do
  session.clear
    "test"
end