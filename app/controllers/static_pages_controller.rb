class StaticPagesController < ApplicationController
  before_action :load_activities
  def home
  end

  def help
  end

  private
  def load_activities
    @activities = PublicActivity::Activity.order("created_at DESC")
      .limit(Settings.pagination.activities)
  end
end
