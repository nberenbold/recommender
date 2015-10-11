module Recommender
  class Configuration
    # Recommender Api Key
    #
    # default: nil
    attr_accessor :api_key

    # Recommender User ID
    #
    # default: nil
    attr_accessor :user_id

    # Api Type
    #
    # default: json
    attr_accessor :api_type

    def initialize
      @api_key  = nil
      @user_id  = nil
      @api_type = :json
    end
  end

  class << self
    def configure
      @config ||= Configuration.new
      yield @config
    end

    def config
      @config ||= Configuration.new
    end
  end
end