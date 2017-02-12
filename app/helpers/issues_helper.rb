module IssuesHelper
  def assigned_issues
    current_user.issues.order(:id).page(params[:page]).per(8)
  end
end
