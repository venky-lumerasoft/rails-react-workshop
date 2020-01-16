class Api::V1::UsersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end
end
