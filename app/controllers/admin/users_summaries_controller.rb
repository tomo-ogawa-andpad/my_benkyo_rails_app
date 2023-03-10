class Admin::UsersSummariesController < ApplicationController
  before_action :require_admin

  include Admin::AdminCommonController

  def index
    @users_summaries = UsersSummary.all
  end
end