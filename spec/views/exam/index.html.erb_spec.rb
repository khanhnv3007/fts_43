require "rails_helper"

describe "exams/index.html.erb" do
  subject {rendered}
  let(:user) {create :user}
  let(:subject) {create :subject}
  let(:exam) {
    (build :exam, subject: subject, user: user).save(validate: false)
  }

  before do
    sign_in user
    assign :exam, exam
    assign :exams, user.exams
    assign :subjects, [subject]
    render
  end

  it do
    expect(rendered).to have_content exam.id
  end
end
