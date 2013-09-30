=begin
Wordnik.configure do |config|
  config.api_key = '4e26346bfdd486c3e000c04558604d39d55d8aab92f03f835'               # required
#  config.username = 'bozo'                    # optional, but needed for user-related functions
#  config.password = 'cl0wnt0wn'               # optional, but needed for user-related functions
  config.response_format = 'json'             # defaults to json, but xml is also supported
  config.logger = Logger.new('/dev/null')     # defaults to Rails.logger or Logger.new(STDOUT). Set to Logger.new('/dev/null') to disable logging.
end
=end
