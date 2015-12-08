require "spec_helper"
describe Subject do
  let(:subject) {FactoryGirl.create :subject}
  describe "create subject" do
    context "valid subject" do
      it {is_expected.to be_valid}
    end
  end

  describe "validation" do
    it {is_expected.to ensure_length_of(:name).is_at_most(100)}
    it {is_expected.to validate_presence_of(:name)}
  end

  describe "association" do
    it {is_expected.to have_many(:exams)}
    it {is_expected.to have_many(:questions)}
  end
end
