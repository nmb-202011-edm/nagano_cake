class Admin::HomesController < ApplicationController

    def top
        now = Time.current
        @orders = Order.where(created_at: now.all_day)
        # dt=DateTime.now
        # today=Date.parse(dt.strftime("%Y/%m/%d %H:%M:%S"))
        # orders=Order.all
        # @sum=0
        # orders.each do |x|
        #     dtx=x.created_at
        #     the_day=Date.parse(dt2.strftime("%Y/%m/%d %H:%M:%S"))
        #     if today == the_day
        #         @sum = @sum +1
        #     end
        # end
    end
end
