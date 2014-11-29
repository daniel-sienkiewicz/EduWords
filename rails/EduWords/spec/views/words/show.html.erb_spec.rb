require 'spec_helper'

describe "words/show" do
  before(:each) do
    @word = assign(:word, stub_model(Word,
      :namelanguage1 => "Namelanguage1",
      :namelanguage2 => "Namelanguage2",
      :member_id => 1,
      :language1_id => 2,
      :language2_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Namelanguage1/)
    rendered.should match(/Namelanguage2/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
