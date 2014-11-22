require 'spec_helper'

describe "home" do
	subject { page }

  describe "index" do
  	before { visit root_path }

  	it { should have_title('EduWords') }

  end
end