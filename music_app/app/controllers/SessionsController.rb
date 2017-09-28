class SessionsController <ApplicationController
  before_action :require_no_user!, only: [:create, :new]

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
    else
      login_user!(user)
      redirect_to user_url #TODO redirect_to bands_url
    end
  end

  def new
    render :new
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end

end
