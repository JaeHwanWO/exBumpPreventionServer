class UsersController < ApplicationController
  before_action :set_user, only: [:update]

  # POST /api/user/host
  def host
    @user = User.create!(user_params)
    @user.randomCode = (0...8).map { (65 + rand(26)).chr }.join
    puts(@user.randomCode)
    @user.save
    json_response(@user, :created)
  end

# POST api/user/invite
  def invite
    @user = User.create!(user_params)
    @otherUser = User.find_by(randomCode: params[:randomCode])
    @otherUser.partnerUUID = @user.myUUID
    @otherUser.save
    @user.save
    json_response(@user, :created)
  end

# POST api/user/update
  def updateGPS
    @user = User.find_by(myUUID: params[:myUUID])
    # 여기까지 잘 옴.
    # 여기 밑에 안되는 이유 모르겠음. 
    @user.latitude = params[:latitude]
    @user.longitude = params[:longitude]
    @user.save

    # 다른 유저 찾기
    # @otherUser = User.where.not(myUUID: @user.myUUID).or(User.where(randomCode: @user.randomCode))
    # json_response(@otherUser, :created)
    json_response(@user, :created)
  end

  private
  def set_user
    @user = User.find(params[:myUUID])
  end

  def user_params
    params.permit(:myUUID, :partnerUUID, :latitude, :longitude, :randomCode)
  end
end
