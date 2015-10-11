module Recommender
  module ViewHelper
    def track_view item, user_id, options = {}
      options = options.merge(event: "view", object_type: item.class.to_s.downcase, object_id: item.id, user_id: user_id)
      get_recommendation_script options
    end

    def track_like item, user_id, options = {}
      options = options.merge(event: "like", object_type: item.class.to_s.downcase, object_id: item.id, user_id: user_id)
      get_recommendation_script options
    end

    def track_dislike item, user_id, options = {}
      options = options.merge(event: "dislike", object_type: item.class.to_s.downcase, object_id: item.id, user_id: user_id)
      get_recommendation_script options
    end

    def track_favorite item, user_id, options = {}
      options = options.merge(event: "favorite", object_type: item.class.to_s.downcase, object_id: item.id, user_id: user_id)
      get_recommendation_script options
    end

    def track_buy item, user_id, options = {}
      options = options.merge(event: "buy", object_type: item.class.to_s.downcase, object_id: item.id, user_id: user_id)
      get_recommendation_script options
    end

    def get_recommendation_script options = {}
      user_id     = options.delete(:user_id)
      object_id   = options.delete(:object_id)
      object_type = options.delete(:object_type)
      event       = options.delete(:event)
      use_script  = options[:script] == nil ? true : options[:script]
      included    = options.delete(:included)

      tracking_code = "
        window.track_recommendation(#{Recommender.config.user_id}, [
          { event: \"#{event}\", object: \"#{object_id}\", type: \"#{object_type}\", user: \"#{user_id}\" }
        ]);
      ".html_safe

      unless included
        script = "
          (function() {
            if (window.track_recommendation) {
              #{tracking_code}
            } else {
              var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
              po.src = '//v1.recommendation.niv-ventures.com/script.js';
              po.onload = function() {
                #{tracking_code}
              }
              var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
            }
          })();".html_safe
      else
        script = tracking_code
      end

      return script unless use_script

      content_tag :script, script
    end
  end
end