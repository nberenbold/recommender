require 'spec_helper'

describe "Api::Calls" do
  subject { Recommender::ApiRequest.new }

  context 'api calls' do
    it 'should return an array of ids' do
      expect(subject.get("predict", "series", "501", 4)).to be_present
    end
  end
end