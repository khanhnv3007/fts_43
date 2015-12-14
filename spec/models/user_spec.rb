require "rails_helper"
require "cancan/matchers"

describe "User" do
  describe "can create user" do
    context "valid user" do
      let(:user){FactoryGirl.create :user}
      it{expect(user.errors).to be_empty}
    end
  end

  describe "can authenticate" do
    context "admin " do
      let(:user){FactoryGirl.create :admin}
      subject(:ability){Ability.new(user)}
      it{is_expected.to be_able_to :manage, Subject}
      it{is_expected.to be_able_to :manage, Question}
      it{is_expected.to be_able_to :manage, User}
      it{is_expected.to be_able_to :manage, Exam}
    end

    context "user" do
      let(:user){FactoryGirl.create :user}
      subject(:ability){Ability.new(user)}
      it{is_expected.not_to be_able_to :manage, Subject.new}
      it{is_expected.not_to be_able_to :manage, Question}
      it{is_expected.not_to be_able_to :manage, User}
      it{is_expected.not_to be_able_to :manage, Exam}
    end
  end
end
