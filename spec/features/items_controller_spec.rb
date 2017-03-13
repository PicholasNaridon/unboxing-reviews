require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe "GET #index" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:item1) { Item.create(name: "Item One", user_id: user.id) }
    let!(:item2) { Item.create(name: "Item Two", user_id: user.id) }

    it "should return all items" do
      get :index
      json = JSON.parse(response.body)

      expect(json.length).to eq(2)
      expect(json[0]["name"]).to eq("Item One")
      expect(json[1]["name"]).to eq("Item Two")
    end
  end
end
