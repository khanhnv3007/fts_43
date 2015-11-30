every "45 23 28-31 * * ['$(date +%d -d tomorrow)' = '01'] &&" do
  rake "exams:check_exam_monthly"
end

every "0 0 * * *" do
  rake "exams:check_exam_daily"
end

