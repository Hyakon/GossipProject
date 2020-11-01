class SessionsController < ApplicationController
  def new
    console
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:session][:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # redirige où tu veux, avec un flash ou pas
      flash.notice = 'Connected'
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
