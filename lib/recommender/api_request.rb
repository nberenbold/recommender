module Recommender
  class ApiRequest
    def get method, class_name, id, limit
      case Recommender.config.api_type
      when :json
        begin
          get_json(method, class_name, id, limit)
        rescue => e
          handle_error(e)
        end
      else
        raise "Unknown Api Type"
      end
    end

    def get_json method, class_name, id, limit
      url = "http://v1.recommendation.niv-ventures.com/#{method}/#{class_name}/#{id.to_s}.json?key=#{Recommender.config.api_key}&limit=#{limit}"
      timeout(Recommender.config.timeout) {
        json_string = open(url).read
        return JSON.parse(json_string)
      }
      nil
    end

    def handle_error error
      case error.class.to_s
      when "OpenURI::HTTPError"
        raise "Wrong Api-Key provided"
      when "Timeout::Error"

      end
    end
  end
end