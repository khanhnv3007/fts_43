namespace :exams do
  desc "Check exam every last day of the month"
  task check_exam_monthly: :environment do
    Exam.check_exam_monthly
  end

  task check_exam_daily: :environment do
    Exam.check_exam_daily
  end
end
