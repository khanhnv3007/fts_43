class Admin::ExamsController < ApplicationController
  load_and_authorize_resource

  def index
    @exams = @exams.page(params[:page])
      .per Settings.pagination.exams_per_page
  end

  def show
  end

  def update
    if @exam.update exam_params
      flash[:success] = t "admin.exam.checked_success"
    else
      flash[:danger] = t "admin.exam.checked_failed"
    end
    redirect_to admin_exams_path
  end

  private
  def exam_params
    params.require(:exam).permit :status, results_attributes: [:id, :is_correct]
  end
end
