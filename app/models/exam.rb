class Exam < ActiveRecord::Base

  after_update :send_exam_noti
  belongs_to :subject
  belongs_to :user

  has_many :results, dependent: :destroy
  has_many :questions, through: :results
  enum status: [:start,:uncheck,:checked]

  accepts_nested_attributes_for :results

  validate :generate_question, on: :create

  def time_remaining
    Settings.exam.time_in_minutes * Settings.exam.sec -
      (Time.zone.now - self.created_at).to_i
  end

  def question_correct
    correct = self.results.where(is_correct: 1).size
    total = self.questions.size
    [correct, total].join("/")
  end

  def send_exam_noti
    SendExamNoti.perform_async self.id if self.checked
  end

  private
  def generate_question
    self.questions = self.subject.questions
      .order("RANDOM()").limit Settings.exam.questions_per_exam
    errors.add :create, I18n.t("exam.create_exam_fail") if self.subject
      .questions.size == 0
  end
end
