class Admins::MysteriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @mysteries = Mystery.page(params[:page]).per(20)
    @mystery_all = Mystery.all
  end

  def show
    @mystery = Mystery.find(params[:id])
  end

  def destroy
    mystery = Mystery.find(params[:id])
    mystery.destroy
    redirect_to admins_mysteries_path
  end
end
