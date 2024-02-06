class CurrentUserController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user
      render json: { data: UserSerializer.new(current_user).serializable_hash[:data][:attributes] }, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end
end
