require 'spec_helper'

describe "tags/new" do
  before(:each) do
    assign(:tag, stub_model(Tag,
      :name => "MyString",
      :language_member_id => 1,
      :member_id => 1
    ).as_new_record)
  end

  it "renders new tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tags_path, "post" do
      assert_select "input#tag_name[name=?]", "tag[name]"
      assert_select "input#tag_language_member_id[name=?]", "tag[language_member_id]"
      assert_select "input#tag_member_id[name=?]", "tag[member_id]"
    end
  end
end
