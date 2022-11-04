class ShopController < ApplicationController
    before_action :user_store, only: %i[index]

    def index
    end

    private
        def user_store
            @user = User.find(params[:id].to_i)
            @store = Item.where(user_id: @user.id)
        end

end
