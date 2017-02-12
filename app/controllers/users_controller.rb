class UsersController < ApplicationController
  def index
    @users = User.all
    @search = @users.ransack(params[:q])
    if params[:q] && (params[:q][:name_or_email_cont].present?)
      @search = @users.ransack(params[:q].permit(:name_or_email_cont).to_h)
      @users = @search.result
    else
      @users = @users.order(:name)
    end
    @users = @users.order(:name).page(params[:page]).per(8)
  end
end
