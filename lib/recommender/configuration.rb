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

    # Read Timeout
    #
    # default: 2
    attr_accessor :timeout

    # Api Version
    #
    # default: v1
    attr_accessor :api_version

    # Api Domain
    #
    # default: simply-suggest.com
    attr_accessor :domain

    def initialize
      @api_key     = nil
      @user_id     = nil
      @api_type    = :json
      @timeout     = 2
      @api_version = "v1"
      @domain      = "simply-suggest.com"
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