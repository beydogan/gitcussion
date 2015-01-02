class StackOverflow
  include HTTParty
  base_uri 'https://api.stackexchange.com/2.2'

  def initialize
    @key = Rails.application.secrets.stack_client_key

  end

  def get_question_count(tag, accepted = nil, options ={})
    options.merge!({:key => @key})
    options.merge!({tagged: tag, site: "stackoverflow",filter: "total", accepted: accepted})
    response = self.class.get("/search/advanced", query: options)
    json = JSON.parse(response.response.body)
    json["total"]
  end

end