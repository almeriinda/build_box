require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "POST #create" do
    context "com um pedido válido" do
      it "cria um novo pedido" do
        order_params = FactoryBot.attributes_for(:order)
        expect {
          post :create, params: { order: order_params }
        }.to change(Order, :count).by(1)
      end

      it "retorna status 201 - created" do
        order_params = FactoryBot.attributes_for(:order)
        post :create, params: { order: order_params }
        expect(response).to have_http_status(:created)
      end
    end

    context "com um pedido inválido" do
      it "retorna status 422 - unprocessable_entity" do
        order_params = {}
        post :create, params: { order: order_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
