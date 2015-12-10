require "rails_helper"

RSpec.describe User, type: :model do
  let!(:user){FactoryGirl.create :user}
  let!(:another_user){FactoryGirl.build :user}

  context "New user" do
    it "valid user" do
      expect(user).to be_valid
    end

    describe "duplicate chatwork_id" do
      subject {FactoryGirl.build :user}
      before {subject.chatwork_id = user.chatwork_id}
      it {is_expected.to have(1).error_on(:chatwork_id)}
    end

    describe "duplicate email" do
      subject {FactoryGirl.create :user}
      before {subject.email = user.email}
      it {is_expected.to have(1).error_on(:email)}
    end

    describe "blank role" do
      subject {FactoryGirl.build :user}
      before {subject.role = ""}
      it {is_expected.to have(1).error_on(:role)}
    end

    describe "blank chatwork_id" do
      subject {FactoryGirl.build :user}
      before {subject.chatwork_id = ""}
      it {is_expected.to have(1).error_on(:chatwork_id)}
    end

    describe "blank email" do
      subject {FactoryGirl.build :user}
      before {subject.email = ""}
      it {is_expected.to have(1).error_on(:email)}
    end

    describe "invalid email" do
      subject {FactoryGirl.build :user}
      before {subject.email = "khanh@khanh"}
      it {is_expected.to have(1).error_on(:email)}
    end

    describe "too long chatwork_id" do
      subject {FactoryGirl.build :user}
      before {subject.chatwork_id = "a" * 51}
      it {is_expected.to have(1).error_on(:chatwork_id)}
    end

    describe "blank password" do
      subject {FactoryGirl.build :user}
      before {subject.password = ""}
      it {is_expected.to have(1).error_on(:password)}
    end

    describe "too long name" do
      subject {FactoryGirl.build :user}
      before {subject.name = "a" * 51}
      it {is_expected.to have(1).error_on(:name)}
    end

    describe "not match password" do
      subject {FactoryGirl.build :user}
      before {subject.password = "qwerty"}
      it {is_expected.to have(1).error_on(:password)}
    end

    describe "blank name" do
      subject {FactoryGirl.build :user}
      before {subject.name = ""}
      it {is_expected.to have(1).error_on(:name)}
    end

    describe "too short password" do
      subject {FactoryGirl.build :user}
      before {
        subject.password = subject.password_confirmation = "a" * 7
      }
      it {is_expected.to have(1).error_on(:password)}
    end
  end
end
