class UserMailer < ApplicationMailer
    default :from => "from@example.com"

    def user_deleted(user)
        @user = user
        mail(:to => user.email, :subject => "Your account is deleted! ")
    end
end
