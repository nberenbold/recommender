module Recommender
  module ViewHelper
    def track_view item, user_id, options = {}
      options = options.merge(event: "view", object_type: item.class.to_s.downcase, object_id: item.id, user_id: user_id)
      get_tracking_code options
    end

    def track_like item, user_id, options = {}
      options = options.merge(event: "like", object_type: item.class.to_s.downcase, object_id: item.id, user_id: user_id)
      get_tracking_code options
    end

    def track_dislike item, user_id, options = {}
      options = options.merge(event: "dislike", object_type: item.class.to_s.downcase, object_id: item.id, user_id: user_id)
      get_tracking_code options
    end

    def track_favorite item, user_id, options = {}
      options = options.merge(event: "favorite", object_type: item.class.to_s.downcase, object_id: item.id, user_id: user_id)
      get_tracking_code options
    end

    def track_buy item, user_id, options = {}
      options = options.merge(event: "buy", object_type: item.class.to_s.downcase, object_id: item.id, user_id: user_id)
      get_tracking_code options
    end

    def get_recommendation_include
      content_tag :script do
        "(function() {
          var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
          po.src = '//static.recommendation.niv-ventures.com/script/v1.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();".html_safe
      end
    end

    def get_tracking_code options = {}
      user_id     = options.delete(:user_id)
      object_id   = options.delete(:object_id)
      object_type = options.delete(:object_type)
      event       = options.delete(:event)
      use_script  = options[:script] == nil ? true : options[:script]

      script = "
        window.track_recommendation = window.track_recommendation || [];
        window.track_recommendation.push([
          { event: \"setAccount\", value: \"#{Recommender.config.user_id}\" },
          { event: \"#{event}\", object: \"#{object_id}\", type: \"#{object_type}\", user: \"#{user_id}\" }
        ]);
      ".html_safe

      return script unless use_script
      content_tag :script, script
    end
  end
end