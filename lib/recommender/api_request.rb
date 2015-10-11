module Recommender
  class ApiRequest
    def initialize options = {}
      @api_type = options.delete(:api_type)
      @user_id  = options.delete(:user_id)
      @api_key  = options.delete(:api_key)
    end

    def get method, class_name, id, limit
      case @api_type
      when :json
        get_json method, class_name, id, limit
      else
        raise "Unknown Api Type"
      end
    end

    def get_json method, class_name, id, limit
      url = "http://v1.recommendation.niv-ventures.com/#{method}/#{class_name}/#{id.to_s}.json?key=#{@api_key}&limit=#{limit}"
      timeout(2) {
        return open(url).read
      }
      ""
    end
  end
end