class Exam < ActiveRecord::Base

  after_update :send_exam_noti
  belongs_to :subject
  belongs_to :user

  has_many :results, dependent: :destroy
  has_many :questions, through: :results
  enum status: [:start,:uncheck,:checked]

  accepts_nested_attributes_for :results

  validate :generate_question, on: :create

  def self.check_exam_daily
    Exam.all.each do |exam|
      if exam.start? && Time.now - exam.created_at > 8.hours
        exam.destroy
      end
      if exam.start? && Time.now - exam.created_at < 8.hours
        UserMailer.send_exam_reminder(exam).deliver_now
      end
    end
  end

  def self.check_exam_monthly
    Exam.all.each do |exam|
      if exam.start? && Time.now - exam.created_at > 8.hours
        exam.destroy
      end
    end
  end

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
    SendExamNoti.perform_async self.id if self.checked?
  end

  private
  def generate_question
    self.questions = self.subject.questions.approved
      .order("RANDOM()").limit Settings.exam.questions_per_exam
    errors.add :create, I18n.t("exam.create_exam_fail") if self.subject
      .questions.approved.size == 0
  end
end
