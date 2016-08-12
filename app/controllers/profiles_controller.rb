class ProfilesController < ApplicationController
  
	before_action :set_user, only: [:show]

	def index
		@users = User.all
	end

  def show
  end

  def new
  	@profile = Profile.new
  end

  def create
  	@profile = Profile.new(profile_params)

  	respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def follow
    @profile = Profile.new
    @user = User.find(params[:id])
    @follow = Follow.create(follower_id: current_user.id, following_id: @user.id)
    respond_to do |format|
      format.js
      format.json
    end
  end

  def unfollow
    @follow = Follow.find_by(follower_id: current_user.id, following_id: params[:id])
    @follow.destroy
  end

  private
  	def set_user
  		@user = User.find(params[:id])
  	end

  	def profile_params
      params.require(:profile).permit(:user_id, :bio, :age, :birthday, :avatar)
    end

end
