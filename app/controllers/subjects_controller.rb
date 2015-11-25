class SubjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @subjects = @subjects.page(params[:page])
      .per Settings.pagination.subjects_per_page
  end
end
