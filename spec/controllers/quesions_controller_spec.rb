require "rails_helper"

describe QuestionsController do
  let(:question) {create :question}
  let(:user) {create :user}
  before do
    sign_in user
    allow(controller).to receive(:current_user).and_return user
  end

  describe "can GET #index" do
    it "render index success" do
      before{get :show, user_id: user.id}
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  describe "can GET #show" do
    before{get :show, id:first_question}
    it "render show success" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe "can POST #create" do
    before{post :create}
    context "can create a question" do
      let(:question_params){FactoryGirl.attributes_for(:question)}
      it{expect(response).to have_http_status(200)}
    end
  end
end
