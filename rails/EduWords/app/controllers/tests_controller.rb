class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    if  member_signed_in?
      if current_member.role == 'admin'
        @tests = Test.all
      else
        @tests = Test.find(:all, :conditions => ['member_id = ?', current_member.id])
      end
      respond_with(@tests)
    else
      redirect_to "/members/sign_in"
    end
  end

  def show
    respond_with(@test)
  end

  def new
    @test = Test.new
    respond_with(@test)
  end

  def edit
  end

  def create
    @test = Test.new(test_params)
    if  member_signed_in?
      @test.member_id = current_member.id
    end
    if @test.member_id != nil
     @test.save
    end
    respond_with(@test)
  end

  def update
    @test.update(test_params)
    respond_with(@test)
  end

  def destroy
    @test.destroy
    respond_with(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:result, :date, :member_id)
  end
end
