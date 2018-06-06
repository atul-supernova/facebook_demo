class CallbackController < ApplicationController
	skip_before_action :verify_authenticity_token
  def index
    if params["hub.verify_token"] == "asd"
      render text: params["hub.challenge"]
    end
  end

  def recieved_data
    therequest = request.body.read
    data = JSON.parse(therequest)
    parse_data(data)
    render "recieved_data"
  end

  def parse_data(data)
  	debugger
    enteries = data["entry"]
    enteries.each do |entry|
      entry["messaging"].each do |messaging|
        sender = messaging["sender"]["id"]
        text = messaging["message"]["text"]
        analysis(sender, text.downcase)
      end
    end
  end

  def analysis(sender, text)
    message = Message.where(:recieved => text).first
    if message
      reply = message.reply
    else
      reply = "Sorry not found"
    end
    send_message(sender,reply)
  end

  def send_message(sender, text)
	 	myjson = {"recipient" => {"id"=> "#{sender}"},"message"=> {"text"=> "#{text}"}}
    puts HTTP.post(url, json: myjson)
  end
  def url
    "https://graph.facebook.com/v2.6/me/messages?access_token=EAAIc6SVsZAc8BAHPBQ1YrV8RGGWK5YDevRinAqlMYjZA1qI6dnnglsEJQYZBpxrTgA9FyZCi8egErm1ZBR6mS4g0e2ITZCVWcwt2grJvs6wRNQuIBpzT0syejFBJrZCyF6C4lUp04Qu5MGJqZAJFOcGhJ1imobLdJm8D2hKdlVuJYQZDZD"
  end
end

