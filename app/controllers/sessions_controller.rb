class SessionsController < ApplicationController
  before_action :set_employee, only: :create

  def create
    unless @employee.present? && @employee.authenticate(session_params[:password])
      render json: { success: false, errors: "Invalid email or password"},status: :unauthorized and return
    end
    render json: { success: true, access_token: @employee.generate_jwt },status: :ok and return
  end

  private

  def set_employee
    @employee = Employee.find_by(email: session_params[:email])
  end

  def session_params
    params.permit(:email,:password)
  end
end
