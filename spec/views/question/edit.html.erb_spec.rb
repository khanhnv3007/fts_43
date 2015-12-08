describe "edit question" do
  let!(:question) {FactoryGirl.create :question}
  scenario "can edit question success" do
    click_button "Save"
    expect(page).to have_content "Operation successed!"
  end
end
