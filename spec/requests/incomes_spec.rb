require 'rails_helper'

RSpec.describe "Incomes", type: :request do

  let(:valid_params) do{
    income: {
      monthly_income: 1000.00
    }
  }
  end

  let(:invalid_params) do{
    income: {
      monthly_income: "100 cedis"
    }
  }
  end

  describe "GET /index" do
    it "returns http success" do
      get "/incomes"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/incomes/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /incomes" do
    context "with valid params" do
      it "creates a new monthly income" do
        expect{
          post "/incomes", params: valid_params}.to change(Income, :count).by(1)

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to incomes_path
      end
    end
    
    context "with invalid params" do
      it "doesn't create a monthly income" do
        expect{
          post "/incomes", params: invalid_params}.to change(Income, :count).by(0)
      
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response).not_to redirect_to incomes_path  
      end
    end
  end

end
