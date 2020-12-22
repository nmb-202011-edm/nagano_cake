
[1mFrom:[0m /home/ec2-user/environment/nagano_cake/app/controllers/public/orders_controller.rb:11 Public::OrdersController#confirm:

     [1;34m9[0m: [32mdef[0m [1;34mconfirm[0m
    [1;34m10[0m:   binding.pry
 => [1;34m11[0m:   @order = [1;34;4mOrder[0m.new(order_params)
    [1;34m12[0m:   @customer = current_customer
    [1;34m13[0m:   @address = [1;34;4mAddress[0m.find(params[[33m:order[0m][[33m:id[0m])
    [1;34m14[0m:   @cart_items = current_customer.cart_items
    [1;34m15[0m: 
    [1;34m16[0m:   @order.payment_method = params[[33m:order[0m][[33m:payment_method[0m]
    [1;34m17[0m:   [1;34m# address_choiceボタンが"〇〇"に選ばれたときというif文[0m
    [1;34m18[0m:   [32mif[0m params[[33m:order[0m][[33m:address_choice[0m] == [31m[1;31m"[0m[31mmy_address[1;31m"[0m[31m[0m
    [1;34m19[0m:     @order.postal_code = @customer.postal_code
    [1;34m20[0m:     @order.name = @customer.last_name + @customer.first_name
    [1;34m21[0m:     @order.address = @customer.address
    [1;34m22[0m:   [32melsif[0m params[[33m:order[0m][[33m:address_choice[0m] == [31m[1;31m"[0m[31maddresses[1;31m"[0m[31m[0m
    [1;34m23[0m:     @order.postal_code = @address.postal_code
    [1;34m24[0m:     @order.name = @address.name
    [1;34m25[0m:     @order.address = @address.address
    [1;34m26[0m:   [32melsif[0m params[[33m:order[0m][[33m:address_choice[0m] == [31m[1;31m"[0m[31mnew_address[1;31m"[0m[31m[0m
    [1;34m27[0m:     @order.postal_code = params[[33m:order[0m][[33m:postal_code[0m]
    [1;34m28[0m:     @order.name = params[[33m:order[0m][[33m:name[0m]
    [1;34m29[0m:     @order.address = params[[33m:order[0m][[33m:address[0m]
    [1;34m30[0m:   [32mend[0m
    [1;34m31[0m: [32mend[0m

