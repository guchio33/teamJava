class RegisterController < DeviseTokenAuth::ApplicationController
    private
        def sign_up_params
            params.permit(:email, :password, :school_id)
        end
end
