class Admin::SubjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @subjects = @subjects.page(params[:page])
      .per Settings.pagination.subjects_per_page
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "admin.subject.add.success"
      redirect_to admin_subjects_path
    else
      flash.now[:danger] = t "admin.subject.add.fail"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t "admin.subject.update.success"
      redirect_to admin_subjects_path
    else
      flash.now[:danger] = t "admin.subject.update.fail"
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] = t "admin.subject.delete.success"
      redirect_to admin_subjects_path
    else
      flash.now[:danger] = t "admin.subject.delete.fail"
      render :index
    end
  end

  private
  def subject_params
    params.require(:subject).permit :name
  end
end
