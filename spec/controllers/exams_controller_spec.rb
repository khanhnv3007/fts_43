require "rails_helper"

describe ExamsController do
  let!(:user){FactoryGirl.create :user}
  let!(:exam){FactoryGirl.create :exam}
  before{sign_in user}

  describe "can GET #index, #show" do
    it "render index success" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
    it "render show success" do
      before do
        get :show,
        exam: FactoryGirl.attributes_for(:exam, user_id: user.id)
      end
      expect(response).to  be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe "can POST #create" do
    it "can create exam" do
      post :create
      it{expect(response).to redirect_to exam_path}
      it{expect(flash[:success]).to be_present}
    end
  end
end
