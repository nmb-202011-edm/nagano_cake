class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :last_name, :first_name, :last_name_kana, :_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
