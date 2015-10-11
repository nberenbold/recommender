require 'action_controller'
require 'action_view'
require "open-uri"

module Recommender
end

require 'recommender/version'
require 'recommender/configuration'
require 'recommender/request'
require 'recommender/api_request'
require 'recommender/controller_helper'

ActionController::Base.send :include, Recommender::ControllerHelper