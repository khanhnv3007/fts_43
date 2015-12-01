class UserMailer < ApplicationMailer

  def exam_result exam
    @exam = exam
    @user = exam.user
    mail to: @user.email, subject: t("mail.exam_subject")
  end

  def exam_reminder exam
    @exam = exam
    @user = exam.user
    mail to: @user.email, subject: t("mail.reminder")
  end
end
