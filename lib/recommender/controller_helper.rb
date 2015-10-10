module Recommender
  module ControllerHelper
    extend ActiveSupport::Concern

    def is_known_crawler?
      bot_detector.is_known_crawler?
    end
  end
end