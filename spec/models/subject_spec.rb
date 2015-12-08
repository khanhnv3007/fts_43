require "spec_helper"
describe Subject do
  let(:subject) {FactoryGirl.create :subject}
  describe "create subject" do
    context "valid subject" do
      it {is_expected.to be_valid}
    end
  end

  describe "validation" do
    before do
      subject.name = "a"*110
    end
    it {expect(subject).to_not be_valid}
  end

  describe "association" do
    it {is_expected.to have_many(:exams)}
    it {is_expected.to have_many(:questions)}
  end
end
