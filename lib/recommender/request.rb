module Recommender
  class Request
    attr_reader :options

    def initialize data = {}
      @options = data
    end

    def recommendations_for item, options = {}
      limit = options.delete(:limit) || 4
      api.get("predict", item.class.to_s.downcase, item.id, limit)
    end

  protected
    def api
      ApiRequest.new
    end
  end
end