module Recommender
  module ControllerHelper
    extend ActiveSupport::Concern

    def recommendations_for item, options = {}
      limit = options.delete(:limit) || 4
      ids = []
      begin
        timeout(2) do
          ids = JSON.parse(open("http://v1.recommendation.niv-ventures.com/predict/#{item.class.to_s.downcase}/#{record.id}.json?user_id=#{user_id}&access_token=#{access_token}&limit=#{limit}").read)
        end
      rescue
      end
      ids
    end

    def user_id
      "2"
    end

    def access_token
      "1234"
    end
  end
end