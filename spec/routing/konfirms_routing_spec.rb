require "rails_helper"

RSpec.describe KonfirmsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/konfirms").to route_to("konfirms#index")
    end

    it "routes to #new" do
      expect(:get => "/konfirms/new").to route_to("konfirms#new")
    end

    it "routes to #show" do
      expect(:get => "/konfirms/1").to route_to("konfirms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/konfirms/1/edit").to route_to("konfirms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/konfirms").to route_to("konfirms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/konfirms/1").to route_to("konfirms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/konfirms/1").to route_to("konfirms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/konfirms/1").to route_to("konfirms#destroy", :id => "1")
    end

  end
end
