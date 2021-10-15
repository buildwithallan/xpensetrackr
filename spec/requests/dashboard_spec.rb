require 'rails_helper'

RSpec.describe "Dashboards", type: :request do
 
 before(:each) do
    user = FactoryBot.create(:user)
    sign_in user
end


  describe "GET /index" do
    it "returns http success" do

      get "/dashboard/index"
      expect(response).to have_http_status(:success)
    end
  end

end
