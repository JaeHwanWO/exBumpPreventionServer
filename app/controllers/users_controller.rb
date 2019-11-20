class UsersController < ApplicationController
  before_action :set_user, only: [:update]

  # POST /api/user/host
  def host
    @user = User.create!(user_params)
    # self.user.randomCode = ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(8).join
    json_response(@user, :created)
  end

# POST api/user/invite
  def invite
    @user = User.create!(user_params)

    @otherUser = User.find(params[:받아온 randomCode])
    # user.partnerUUID = @otherUser.myUUID
    json_response(@user, :created)
  end

# PUT api/user/update
  def update
    # 위치를 받아와서 update
    # longtitude, latitude 업데이트
    # 상대의 위치와 비교
    # 50m 이내이면 return true
  end

  private
  def set_user
    @user = User.find(params[:myUUID])
  end

  def user_params
    params.permit(:myUUID, :partnerUUID)
  end
end
