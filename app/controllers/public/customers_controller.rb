class Public::CustomersController < ApplicationController

  def my_page
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end
end
