class QuestionsController < ApplicationController
  load_and_authorize_resource

  def new
    @subjects = Subject.all
    @question.answers.build
  end

  def create
    if @question.save
      flash[:sucess] = t "questions.success"
    else
      flash[:danger] = t "questions.fail"
    end
    redirect_to :back
  end

  private
  def question_params
    params.require(:question).permit :content, :subject_id, :user_id,
      answers_attributes: [:id, :content, :is_correct]
  end
end
