class UsersController < ApplicationController
  def show
    search_results = SearchResults.new
    if current_user.github_token
      @repos = search_results.repos(current_user.github_token)
      @followers = search_results.followers(current_user.github_token)
      @following = search_results.following(current_user.github_token)
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Username already exists'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
