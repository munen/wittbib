require "spec_helper"

describe LendingsController do
  describe "routing" do

    it "routes to #index" do
      get("/lendings").should route_to("lendings#index")
    end

    it "routes to #new" do
      get("/lendings/new").should route_to("lendings#new")
    end

    it "routes to #show" do
      get("/lendings/1").should route_to("lendings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lendings/1/edit").should route_to("lendings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lendings").should route_to("lendings#create")
    end

    it "routes to #update" do
      put("/lendings/1").should route_to("lendings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lendings/1").should route_to("lendings#destroy", :id => "1")
    end

  end
end
