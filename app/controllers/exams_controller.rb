class ExamsController < ApplicationController
  load_and_authorize_resource

  def index
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

  private
  def exam_params
    params.require(:exam).permit :subject_id
  end
end
