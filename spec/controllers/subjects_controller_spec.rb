require "rails_helper"

describe SubjectsController do
  let(:subject) {create :subject}
  let(:user) {create :user}
  before do
    sign_in user
    allow(controller).to receive(:current_user).and_return user
  end

  describe "GET index" do
    before {get :index}
    it {expect(response).to render_template :index}
    it {expect(response.status).to eq 200}
  end
end
