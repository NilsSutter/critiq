class GetSlackChannelsJob < ApplicationJob
  queue_as :default

  def perform
    # Returns a HASH that is a list of all channels
    puts "> Fetching channel list from SLACK API"
    HTTParty.get("https://slack.com/api/conversations.list",
      query: {
        token: ENV["SLACK_API_TOKEN"],
        types: "public_channel",
        exclude_archived: "true"
         })
  end
end
