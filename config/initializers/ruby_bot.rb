SlackRubyBot::Client.logger.level = Logger::INFO

SlackRubyBot.configure do |config|
  config.logger = Logger.new("slack-ruby-bot.log", "daily")
end
