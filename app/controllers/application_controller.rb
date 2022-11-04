class ApplicationController < ActionController::Base

    private
    def login
        return sessin[:login] == true
    end

    def must_login
        if login
            return true
       else
            redirect_to main_login_path, alert: 'Please login before acess to other page'
       end
    end

end
