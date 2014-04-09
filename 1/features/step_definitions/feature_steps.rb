require_relative "../../lib/song_recommendation"
require_relative "../../lib/recommendation_analyzer"
require_relative "../../lib/recommendation_request"
require_relative "../../lib/song"

Given(/^an "(.*?)" file containing:$/) do |file_name, content|
  File.write file_name, content
end


When(/^I run the search using the "(.*?)" file$/) do |file_name|
  recommender = SongRecommendation.new file_name
  recommender.display_result
end


Then(/^the output should be:$/) do |output|
  expect($stdout.string.chomp).to eq output
end
