module Admin::AdminCommonController
  extend ActiveSupport::Concern

  private

  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end