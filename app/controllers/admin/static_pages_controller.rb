class Admin::StaticPagesController < ApplicationController
  before_action :load_activities
  def admin_home
  end

  def help
  end

  private
  def load_activities
    @activities = PublicActivity::Activity.order("created_at DESC")
      .limit(Settings.pagination.activities)
  end
end
