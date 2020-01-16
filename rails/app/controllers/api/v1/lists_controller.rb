class Api::V1::ListsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :dashboard, only:[:create, :update]

  def create
    list = dashboard.lists.build(list_params)
    if list.save
      render json: list, status: :created
    else
      render json: { error: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
       render json: list, status: :created
    else
      render json: { error: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def dashboard
    @dashboard ||= Dashboard.find(params[:dashboard_id])
  end

  def list_params
    params.require(:list).permit(:title, :sort_order, :dashboard_id)
  end
end
