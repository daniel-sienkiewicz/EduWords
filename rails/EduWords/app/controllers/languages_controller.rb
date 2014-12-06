class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    if  member_signed_in?
      if current_member.role == 'admin'
        @languages = Language.all
      else
        @languages = Language.find(:all, :conditions => ['member_id = ?', current_member.id])
      end
      respond_with(@tests)
    else
      redirect_to "/members/sign_in"
    end
  end

  def show
    if  member_signed_in?
      respond_with(@language)
    else
      redirect_to "/members/sign_in"
    end
  end

  def new
    if  member_signed_in?
      @language = Language.new
      respond_with(@language)
    else
      redirect_to "/members/sign_in"
    end
  end

  def edit
  end

  def create
    if  member_signed_in?
      @language = Language.new(language_params)
      @language.member_id = current_member.id
      @language.save
      respond_with(@language)
    else
      redirect_to "/members/sign_in"
    end
  end

  def update
    if  member_signed_in?
      @language.update(language_params)
      respond_with(@language)
    else
      redirect_to "/members/sign_in"
    end
  end

  def destroy
    if  member_signed_in?
      @language.destroy
      respond_with(@language)
    else
      redirect_to "/members/sign_in"
    end
  end

  private

  def set_language
    @language = Language.find(params[:id])
  end

  def language_params
    params.require(:language).permit(:name, :member_id)
  end
end
