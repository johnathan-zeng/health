class UsersController < ApplicationController

def new
    @user = User.new
end

def create
    @user = User.new(user_params)
    if @user.save
    redirect_to users_path
    else
    render 'new'
    end
end

  def index
    @users=User.all
  end

def edit
@user = User.find(params[:id])
end

def destroy
    @user = User.find(params[:id])
    if @user == current_user
    @user.destroy
    redirect_to users_path
	else
	redirect_to :back, :alert => "Access Denied"
	end
end

def update
 @user = User.find(params[:id])
 if @user.update_attributes(user_params)
  redirect_to user_path(@user.id)
 else
  render 'edit'
 end
end

def show
    @user = User.find(params[:id])
    @posts = @user.posts
end

private

    def user_params
        params.require(:user).permit(:name, :email)
    end

end