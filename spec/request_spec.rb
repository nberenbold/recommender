require 'spec_helper'

describe "Api::Calls" do
  subject { Recommender::ApiRequest.new(api_type: Recommender.config.api_type, api_key: "1234", user_id: "2") }

  context 'api calls' do
    it 'should return an array of ids' do
      expect(subject.get("predict", "series", "501", 4)).to be_present
    end
  end
end