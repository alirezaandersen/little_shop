class Text


  def self.scheduled_visit_text(user, visit)
    if user.phone_number
      Twilio.configure do |config|
        config.account_sid = ENV["twilio_sid"]
        config.auth_token = ENV["twilio_token"]
      end
      @client = Twilio::REST::Client.new
      @client.messages.create(
      from: "+1#{ENV["twilio_phone_number"]}",
      to: user.phone_number,
      body: "You have scheduled a visit for #{visit.date.strftime("%A, %b %d, %Y")}.
The visit will last #{visit.duration} minutes."
      )
    end
  end
end
