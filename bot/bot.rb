class Bot < SlackRubyBot::Bot
  # command 'say' do |client, data, match|
  #   #Rails.cache.write next_id, { text: match['expression'] }
  #   client.say(channel: data.channel, text: match['expression'])
  # end
  #
  # command 'write' do |client, data, match|
  #   entry = Slackbotdev.new(content: data.text, slack_channel: data.channel, slack_user: data.user)
  #   # binding.pry
  #   client.say(channel: data.channel, text: "DEBUG: Got it.")
  # end
end

class Unknown < SlackRubyBot::Commands::Base
  match(/^(?<bot>\S*)[\s]*(?<expression>.*)$/)

  def self.call(client, data, _match)
    client.say(channel: data.channel, text: "::Monkeypatch::")
    entry = Slackbotdev.new(content: data.text, slack_channel: data.channel, slack_user: data.user)
    # binding.pry
    if entry.save!
      client.say(channel: data.channel, text: "DEBUG: Message Saved")
    else
      client.say(channel: data.channel, text: "DEBUG: Message NOT Saved!")
    end
  end
end
