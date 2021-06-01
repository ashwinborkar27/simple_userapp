class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
    def index
        @users = User.all
    end

	def new
		@user = User.new
	end
    
    def create
	    @user = User.create(user_params)
	    if @user.save
	        redirect_to users_path, notice: "#{@user.username} #{@user.email} #{@user.address} was successfully created."
	    # raise @user.inspect
	    else
	        render "new"
	    end
    end


	def show
       
    end

    def edit

    end

    def update
	    if @user.update(user_params)
	        redirect_to @user, notice: "#{@user.username} #{@user.email} #{@user.address} was successfully created."
	    else
	        render "edit"
	    end
    end

    def destroy
        @user.destroy
        redirect_to @user, notice: "#{@user.username} #{@user.email} #{@user.address} was successfully created."
    end


	private
	def set_user
        @user = User.find(params[:id])
    end

    
	def user_params
	  params.require(:user).permit(:username, :email, :address, profile_attributes: [ :id, :userheight, :userage, :usergeneder, :_destroy ])
	end
		
	
end



