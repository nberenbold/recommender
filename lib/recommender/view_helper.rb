module Recommender
  module ViewHelper
    def track_view item, user_id
      get_recommendation_script event: "view", object_type: item.class.to_s.downcase, object_id: item.id, user_id: user_id
    end

    def get_recommendation_script options = {}
      user_id     = options.delete(:user_id)
      object_id   = options.delete(:object_id)
      object_type = options.delete(:object_type)
      event       = options.delete(:event)

      content_tag :script do
        "(function() {
          var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
          po.src = '//v1.recommendation.niv-ventures.com/script.js';
          po.onload = function() {
            window.track_recommendation(#{Recommender.config.user_id}, [
              { event: \"#{event}\", object: \"#{object_id}\", type: \"#{object_type}\", user: \"#{user_id}\" }
            ]);
          }
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();".html_safe
      end
    end
  end
end