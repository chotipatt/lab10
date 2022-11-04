class MainController < ApplicationController
  before_action :param_cal , only: %i[calculate]

  def login
  end

  def user_item
    user = session[:user]
    id = session[:user_id]
    @store = Item.where(user_id: id)
  end

  def create
    a = User.where(login: params[:login]).first
    if a && a.authenticate(params[:password])
      redirect_to main_user_item_path
      session[:login] = true
      session[:user] = a
      session[:user_id] = a.id
    else
      redirect_to main_login_path, alert: 'Login or password incorrect'
    end
  end

  def inventories
    user = session[:user]
    id = session[:user_id]
    @inventory = Inventory.where(user_id: id)
    pp '-----------'
    pp id
  end

  def destroy
    reset_session
    redirect_to main_login_path, notice: 'already logged out'
  end

  def calculate
    a = @item
    save = a
    stock = a.stock
    @amount = stock-1

    if @amount == 0
      a.destroy
    else
      a.update(stock: @amount)
    end

    customer = session[:user]
    id = session[:user_id]
    customer_inventory = Inventory.create(user_id: id, item_id: save.id, price: save.price)

    redirect_to shop_path(id: save.user_id)
  end

  private 
  
    def param_cal
      @item = Item.find(params[:item].to_i)
    end

end
