require 'sinatra'
require 'telegram/bot'


token = "5871038331:AAH-e3CYF37WXpY_sRiDHI7q9TonLAtUj6M"
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
  data = JSON.parse request.body.read
  msg = "Студент (#{data['username']}) не сможет прийти на пару \n подробности: #{data['desc']}"
  bot.api.send_message(chat_id: chat_id, text: msg) 
  "done"
end