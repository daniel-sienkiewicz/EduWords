require 'spec_helper'

describe "home" do
	subject { page }

  describe "index" do
  	before { visit root_path }

  	it { should have_title('EduWords') }
  	it { should have_selector("img") }
  	it { should have_content("EduWords Home Account") }
  end
end

describe "members" do
	subject { page }

  describe "sign_in" do
  	before { visit root_path }

  	it { should have_title('EduWords') }
  	it { should have_content("EduWords Home Account") }
  end

  describe "sign_up" do
  	before { visit root_path }

  	it { should have_title('EduWords') }
  	it { should have_content("EduWords Home Account") }
  end
end