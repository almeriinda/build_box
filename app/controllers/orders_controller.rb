class OrdersController < ApplicationController
  def index
  end

  def create
    if valid_order?
      @order = Order.new(order_params)
      if @order.save
        render json: @order, status: :created
      else
        render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "Invalid product selection" }, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params[:order][:selected_product_names]&.map!(&:strip)&.map! { |name| name.gsub(/^"|"$/, '') } if params[:order][:selected_product_names]
    params.require(:order).permit(selected_product_names: [])
  end

  def valid_order?
    selected_products = params[:order][:selected_product_names]

    processors_selected = selected_products.select { |product| product.include?("Processador") }
    return false if processors_selected.size != 1

    motherboards_selected = selected_products.select { |product| product.include?("Placa Mãe") }
    return false if motherboards_selected.size != 1

    ram_selected = selected_products.select { |product| product.include?("Memória RAM") }
    return false if ram_selected.empty?

    video_cards_selected = selected_products.select { |product| product.include?("Placa de Vídeo") }
    return false if video_cards_selected.size > 1

    true
  end


end
