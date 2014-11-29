require 'spec_helper'

describe "words/index" do
  before(:each) do
    assign(:words, [
      stub_model(Word,
        :namelanguage1 => "Namelanguage1",
        :namelanguage2 => "Namelanguage2",
        :member_id => 1,
        :language1_id => 2,
        :language2_id => 3
      ),
      stub_model(Word,
        :namelanguage1 => "Namelanguage1",
        :namelanguage2 => "Namelanguage2",
        :member_id => 1,
        :language1_id => 2,
        :language2_id => 3
      )
    ])
  end

  it "renders a list of words" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Namelanguage1".to_s, :count => 2
    assert_select "tr>td", :text => "Namelanguage2".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
