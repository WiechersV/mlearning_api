class UsersController < ApplicationController
  include UserConcern

  before_action :validate_college_existence, :validate_exam_existence, :validate_exam_associations, on: [:create]

  def create
    @user = User.new(user_params)
    
    if @user.save
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :phone_number,
      :exam_id,
    )
  end
end
