require_relative '../spec_helper'

describe "item" do
  let(:item) {Item.create(name: "dog", description: "real dog", price: "no")}

  before do
    item
  end

  it "should respond to /cat" do
    get "/categories/:category_id/items/:id"
    expect(last_response).to be_ok
  end
end