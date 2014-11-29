require 'spec_helper'

describe "words/new" do
  before(:each) do
    assign(:word, stub_model(Word,
      :namelanguage1 => "MyString",
      :namelanguage2 => "MyString",
      :member_id => 1,
      :language1_id => 1,
      :language2_id => 1
    ).as_new_record)
  end

  it "renders new word form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", words_path, "post" do
      assert_select "input#word_namelanguage1[name=?]", "word[namelanguage1]"
      assert_select "input#word_namelanguage2[name=?]", "word[namelanguage2]"
      assert_select "input#word_member_id[name=?]", "word[member_id]"
      assert_select "input#word_language1_id[name=?]", "word[language1_id]"
      assert_select "input#word_language2_id[name=?]", "word[language2_id]"
    end
  end
end
