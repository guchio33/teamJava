class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
    private

    def sign_up_params
      params.permit(:name, :email, :password,:school_id)
    end
end
