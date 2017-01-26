require 'rails_helper'

RSpec.describe ContractsController, type: :controller do
  describe "GET #index" do
    it "show @contrcts" do
      get :index
      expect(response).to have_http_status(:success)
      expect(controller.instance_variable_get("@contracts")).to eq Contract.all
    end
  end
  describe "GET #show" do
    it "show @content" do
      get :show, params: { id: 'test' }
      contract = Contract.new('test')
      expected = Kramdown::Document.new(contract.content, input: 'GFM').to_html
      expect(controller.instance_variable_get("@content")).to eq expected
    end
  end
end
