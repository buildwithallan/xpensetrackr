require 'rails_helper'

RSpec.describe "Expenses", type: :request do

let(:valid_params) do {
  expense: {
    expense_name: "Uber", 
    category: "Transportation",
     amount: 10.00}
}
end

let(:invalid_params) do {
  expense: {
    expense_name: nil, 
    category: "Transportation",
     amount: 10.00}
}
end

  describe "GET /index" do
    it "returns http success" do
      get "/expenses"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_expense_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
   let(:expense){create(:expense)}

    it "returns http success" do
      get edit_expense_path(expense)
      expect(response).to have_http_status(:success)
    end
  end


  describe "#update" do
   let(:expense){create(:expense)}

   context "with valid params" do
      it "updates expenses" do
       expect{
        patch "/expenses/#{expense.id}", params: valid_params}.to change(Expense, :count).by(1)

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to expenses_path    
      end
   end

   context "with invalid params" do
    it "doesn't update expenses" do
      patch "/expenses/#{expense.id}", params: invalid_params

      expect(response).to have_http_status(:unprocessable_entity) 
      expect(response).not_to redirect_to expenses_path
    end
   end
  end


  describe "POST /expenses" do
    context "with valid params" do
      it "creates a new expense" do
       expect{
        post "/expenses", params: valid_params}.to change(Expense, :count).by(1)

       expect(response).to have_http_status(:redirect) 
       expect(response).to redirect_to expenses_path
      end
    end

    context "with invalid params" do 
      it "doesn't create a new expense" do
       expect{
        post "/expenses", params: invalid_params}.to change(Expense, :count).by(0)
    
       expect(response).to have_http_status(:unprocessable_entity) 
       expect(response).not_to redirect_to expenses_path
      end
    end
  end

  describe "DELETE /expenses/:id" do
    let(:expense){create(:expense)}

      it "will delete an expense and redirect to expenses path" do

        delete expense_path(expense), params: {id: expense.id}
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to expenses_path
      end
  end

end
