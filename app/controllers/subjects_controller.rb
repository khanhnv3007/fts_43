class SubjectsController < ApplicationController

  def index
    @subjects = Subject.page(params[:page])
      .per Settings.pagination.subjects_per_page
  end
end
