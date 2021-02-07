class UsersController < ApplicationController
  before_action :set_user, only: [:update]

  # POST /api/user/register
  # 가입하는 함수
  def register
    @user = User.create!(user_params)
    @user.randomCode = (0...6).map { (65 + rand(26)).chr }.join
    @user.myUUID = params[:myUUID]
    puts(@user.randomCode)
    puts(@user.myUUID)
    @user.save
    json_response(@user, :created)
  end

  # POST /api/user/connect
  # 유저간 연결하기
  def connect
    @me = User.find_by(myUUID: params[:myUUID])
    if !@me
      raise "NO ME"
      return
    end
    @me.partnerUUID = params[:partnerUUID]

    @partner = User.find_by(myUUID: params[:partnerUUID])
    # 예외처리?
    if !@partner
         raise "NO PARTNER"
      return
    else
      @partner.partnerUUID = params[:myUUID]
    end

    @me.save
    @partner.save

    json_response("success")
  end

# POST api/user/updateGPS
  def updateGPS
    @user = User.find_by(myUUID: params[:myUUID])
    @user.latitude = params[:latitude]
    @user.longitude = params[:longitude]
    @user.save

    # 다른 유저 찾기
    @otherUser = User.where.not(myUUID: @user.myUUID).where(randomCode: @user.randomCode)[0]
    json_response(@otherUser, :created)
  end

  # POST api/user/receiveGPS
  def receiveGPS
    @user = User.find_by(myUUID: params[:myUUID])
    @user.latitude = params[:latitude]
    @user.longitude = params[:longitude]
    @user.save

    # 다른 유저 찾기
    @otherUser = User.where.not(myUUID: @user.myUUID).where(randomCode: @user.randomCode)[0]
    json_response(@otherUser, :created)
  end

  private
  def set_user
    @user = User.find(params[:myUUID])
  end

  def user_params
    params.permit(:myUUID, :partnerUUID, :latitude, :longitude, :randomCode)
  end
end
