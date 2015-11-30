class Admin::ExamsController < ApplicationController
  load_and_authorize_resource

  def index
    option = params[:option].nil? ? Settings.exam.all : params[:option]
    @exams =  Exam.send(option).page(params[:page])
      .per Settings.pagination.exams_per_page
  end

  def show
  end

  def create
    @exam.user_id = current_user.id
    if @exam.save
      flash[:success] = t "exam.create_exam_complete"
      redirect_to @exam
    else
      flash[:danger] = @exam.errors.full_messages.join(", ")
      redirect_to admin_subjects_path
    end
  end

  def update
    if @exam.update exam_params
      flash[:success] = t "admin.exam.checked_success"
    else
      flash[:danger] = t "admin.exam.checked_failed"
    end
    redirect_to @exam
  end

  private
  def exam_params
    params.require(:exam).permit :subject_id, :status, results_attributes: [:id, :is_correct]
  end
end
