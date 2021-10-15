require 'rails_helper'

RSpec.describe "Incomes", type: :request do


 before(:each) do
    user = FactoryBot.create(:user)
    sign_in user
 end

  let(:valid_params) do{
    income: {
      income_date: "10/01/2021",
      monthly_income: 1000.00
    }
  }
  end

  let(:invalid_params) do{
    income: {
      income_date: "10/01/2021",
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

   describe "GET /edit" do
    let(:income){create(:income)}

    it "returns http success" do
      get edit_income_path(income)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#update" do
   let(:income){create(:income)}

   context "with valid params" do
      it "updates income" do
       expect{
        patch "/incomes/#{income.id}", params: valid_params}.to change(Income, :count).by(1)

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to incomes_path    
      end
   end

   context "with invalid params" do
    it "doesn't update income" do
      patch "/incomes/#{income.id}", params: invalid_params

      expect(response).not_to redirect_to incomes_path
    end
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
      
          expect(response).not_to redirect_to incomes_path  
      end
    end
  end

  describe "DELETE /incomes/:id" do
    let(:income){create(:income)}

      it "will delete an expense and redirect to expenses path" do
        delete income_path(income), params: {id: income.id}
        
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to incomes_path
      end
  end

end
