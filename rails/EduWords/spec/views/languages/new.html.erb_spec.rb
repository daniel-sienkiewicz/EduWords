require 'spec_helper'

describe "languages/new" do
  before(:each) do
    assign(:language, stub_model(Language,
      :name => "MyString",
      :member_id => 1
    ).as_new_record)
  end

  it "renders new language form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", languages_path, "post" do
      assert_select "input#language_name[name=?]", "language[name]"
      assert_select "input#language_member_id[name=?]", "language[member_id]"
    end
  end
end
