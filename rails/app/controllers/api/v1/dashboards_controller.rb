class Api::V1::DashboardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    dashboards = Dashboard.includes(lists: :cards).all
    render json: dashboards, each_serializer: BasicDashboardSerializer
  end

  def show
    dashboard = Dashboard.includes(lists: :cards).find(params[:id])
    if dashboard
      render json: dashboard, include: '**', format: :json
    else
      render json: { error: "Dashboard with id #{params[:id]} Not found" }, status: :not_found
    end
  end

  def create
    dashboard = Dashboard.new(dashboard_params)
    if dashboard.save
      render json: dashboard, serializer: BasicDashboardSerializer, status: :created
    else
      render json: { error: dashboard.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    dashboard = Dashboard.find(params[:id])
    if dashboard.update(dashboard_params)
      render json: dashboard, serializer: BasicDashboardSerializer, status: :ok
    else
      render json: { error: dashboard.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def dashboard_params
    params.require(:dashboard).permit(:title, :user_id)
  end
end
