module Recommender
  class Request
    attr_reader :options

    def initialize data = {}
      @options = data
    end

    def recommendations_for item, options = {}
      limit = options.delete(:limit) || 4

      result = ApiRequest.new(type: Recommender.config.api_type, api_key: Recommender.config.api_key, user_id: Recommender.config.user_id).get("predict", item.class.to_s.downcase, item.id, limit)
      JSON.parse(result)
    end
  end
end