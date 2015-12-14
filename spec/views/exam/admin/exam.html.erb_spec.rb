require "rails_helper"

describe "show all exam" do
  before{@exams = Exam.all}
  it "request to exams controller and index action" do
    assign :exams, @exams
    render
    expect(controller.request.path_parameters[:controller]).to eq "admin/exams"
    expect(controller.request.path_parameters[:action]).to eq "index"
  end
end
