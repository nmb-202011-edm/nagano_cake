class Public::AddressesController < ApplicationController

    def index
        # @addresses=Address.all
        @address=Address.new
        @addresses=Address.where(customer_id: current_customer.id)
    end

    def create

         address=Address.new(address_params)
         address.customer_id=current_customer.id
        #   binding.pry
        if address.save
         redirect_to request.referer
        else
         redirect_to request.referer
        end
    end

    def edit
        @address=Address.find(params[:id])
        # binding.pry
    end

    def destroy

        Address.find(params[:id]).destroy
        redirect_to request.referer
    end

    def update
      # binding.pry
      address=Address.find(params[:id])
      if address.update(address_params)
        redirect_to addresses_path
      else
        redirect_to root_path
      end
    end



    private

      def address_params
        params.require(:address).permit(:postal_code, :name, :address)
      end

end
