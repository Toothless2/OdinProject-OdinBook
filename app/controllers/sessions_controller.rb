class SessionsController < Devise::SessionsController

    def acceptrequest
        unless friend_accept_params
            return
        end

        current_user.recivedrequests.find_by(sender: friend_accept_params).destroy
        current_user.addFriend(User.find(friend_accept_params))
        redirect_to root_path
    end

    def sendrequest
        Friend.create(sender: current_user.id, recipient: friend_request_params)
        redirect_to root_path
    end

    def removefriend
        current_user.removeFriend(User.find(friend_accept_params))
    end

    private
    def friend_request_params
        params.require(:user_id)
    end

    def friend_accept_params
        params.require(:user_id)
    end
end