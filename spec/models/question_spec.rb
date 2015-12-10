require "rails_helper"

RSpec.describe Question, type: :model do

  describe "blank content" do
    subject {FactoryGirl.build :question}
    before {subject.content = ""}
    it {is_expected.to have(1).error_on(:content)}
  end

  describe "association" do
    subject {FactoryGirl.create :question}
    before {subject.answers = []}
    it {is_expected.to have(1).error_on(:answers)}
  end
end
