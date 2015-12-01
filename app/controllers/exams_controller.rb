class ExamsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
    @time_remain = @exam.time_remaining
  end

  def create
    @exam.user_id = current_user.id
    if @exam.save
      flash[:success] = t "exam.create_exam_complete"
      redirect_to @exam
    else
      flash[:danger] = @exam.errors.full_messages.join(", ")
      redirect_to subjects_path
    end
  end

  def update
    if @exam.update_attributes exam_params
      flash[:success] = t "exam.create_exam_complete"
    else
      flash[:danger] = t "exam.create_exam_fail"
    end
    redirect_to @exam
  end

  private
  def exam_params
    params.require(:exam).permit :user_id, :status, :subject_id, results_attributes: [
      :id, :content_answer, content_answer: []]
  end
end
