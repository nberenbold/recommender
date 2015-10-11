module Recommender
  module ControllerHelper
    extend ActiveSupport::Concern

    def recommendations_for item, options = {}
      Recommender::Request.new.recommendations_for item, options = {}
    end
  end
end