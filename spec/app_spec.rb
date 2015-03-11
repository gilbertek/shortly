require 'spec_helper'

describe 'URL Shortening Service' do

  describe "Get home page" do
    it "should load the home page" do
      get '/'
      expect(last_response.status).to eq 200
    end
  end

  describe "Post url" do
    it "should return a short url when user submit a valid link" do
      post '/', :link =>"http:google.com"
      expect(last_response.status).to eq 200
    end

    context "Url param missing" do
      it "returns status 400" do
        post "/"
        expect(last_response.status).to eq 400
      end
    end
  end

  describe "Get top links" do
    it "should display top links" do
      get '/top_links'
      expect(last_response.status).to eq 200
    end
  end

end