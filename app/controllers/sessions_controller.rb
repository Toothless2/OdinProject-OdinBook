class SessionsController < Devise::SessionsController
    
    def sendrequest
        Friend.create(sender: current_user.id, recipient: friend_request_params)
    end

    private
    def friend_request_params
        params.require(:user_id)
    end
end