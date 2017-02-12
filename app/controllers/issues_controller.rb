class IssuesController < ApplicationController
  before_action :set_issue, only: [:edit, :update, :destroy]

  def index
    @issues = Issue.all.order(:id).page(params[:page]).per(8)
  end

  def new
    @issue = Issue.new
  end

  def edit
  end

  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to issues_path, notice: 'Issue was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to issues_path, notice: 'Issue was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.require(:issue).permit(:subject, :description, :assigned_to_id)
    end
end
