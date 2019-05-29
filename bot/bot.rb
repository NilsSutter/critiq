class Bot < SlackRubyBot::Bot
  # command 'say' do |client, data, match|
  #   #Rails.cache.write next_id, { text: match['expression'] }
  #   client.say(channel: data.channel, text: match['expression'])
  # end
  #
  command 'help' do |client, data, match|
    # binding.pry
    client.say(channel: data.channel, text: "HELP: Thse are the following commands you have access to:")
    client.say(channel: data.channel, text: "HELP: None. Sorry.")
  end
end


# Monkeypatch for the UNKNOWN COMMAND error, to instead save the response without a keyword

class Unknown < SlackRubyBot::Commands::Base
  match(/^(?<bot>\S*)[\s]*(?<expression>.*)$/)

  def self.call(client, data, _match)
    entry = Slackbotdev.new(content: data.text, slack_channel: data.channel, slack_user: data.user)
    # client.say(channel: data.channel, text: "DEBUG: Monkeypatch")
    # if !entry.id.nil?
    #   client.say(channel: data.channel, text: "DEBUG: Message ALREADY Saved")
    # elsif entry.save!
    #   client.say(channel: data.channel, text: "DEBUG: Message Saved")
    # else
    #   client.say(channel: data.channel, text: "DEBUG: Message NOT Saved!")
    # end
  end
end
