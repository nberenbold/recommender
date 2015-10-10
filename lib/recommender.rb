require 'action_controller'
require 'action_view'

module Recommender
end

require 'recommender/version'
require 'recommender/controller_helper'

ActionController::Base.send :include, Recommender::ControllerHelper