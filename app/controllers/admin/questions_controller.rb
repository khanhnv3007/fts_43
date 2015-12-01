class Admin::QuestionsController < ApplicationController
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

  def index
    option = params[:option].nil? ? Settings.questions.all : params[:option]
    @questions = Question.send(option).page(params[:page])
      .per Settings.pagination.questions_per_page
  end

  def edit
    @subjects = Subject.all
    @question.answers.build
  end

  def update
    if @question && @question.update_attributes(question_params)
      flash[:sucess] = t "questions.success"
      redirect_to admin_questions_path
    else
      flash[:danger] = t "questions.fail"
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t "questions.success"
    else
      flash.now[:danger] = t "questions.fail"
    end
    redirect_to :back
  end

  private
  def question_params
    params.require(:question).permit :question_type, :content, :subject_id,
      :user_id, :status, answers_attributes: [:id,
      :is_correct, :content, :_destroy]
  end
end
