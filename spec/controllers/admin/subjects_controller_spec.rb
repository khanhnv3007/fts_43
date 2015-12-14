require "rails_helper"

describe Admin::SubjectsController do
  let!(:subject){FactoryGirl.create :subject}
  let!(:admin){FactoryGirl.create :admin}
  before{sign_in admin}
  after{Subject.destroy_all}

  describe "can GET #index" do
    it "render subject index success" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end
  describe "can GET #show" do
    before{get :show, id:first_subject}
    it "render show success" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end
  describe "can POST #create" do
    before{post :create}
    context "can create a subject" do
    let(:subject_params){FactoryGirl.attributes_for(:subject)}
    it{expect(response).to redirect_to admin_subjects_path}
    it{expect(flash[:success]).to be_present}
    end
  end

  describe "GET edit" do
    before{get :edit, id: subject}
    it{expect(assigns(:subject)).to eq subject}
    it{expect(response).to render_template :edit}
    it{expect(response.status).to eq 200}
  end

  describe "DELETE destroy" do
    before{delete :destroy, id: subject}
    it{expect(flash[:success]).to be_present}
    it{expect(response).to redirect_to [:admin, :subjects]}
  end

end
