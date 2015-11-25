class Exam < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user

  has_many :results, dependent: :destroy
  has_many :questions, through: :results

  validate :generate_question, on: :create

  private
  def generate_question
    self.questions = self.subject.questions
      .order("RANDOM()").limit Settings.exam.questions_per_exam
    errors.add :create, I18n.t("exam.create_exam_fail") if self.subject
      .questions.size == 0
  end
end
