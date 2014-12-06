class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    if  member_signed_in?
      if current_member.role == 'admin'
        @tags = Tag.all
      else
        @tags = Tag.find(:all, :conditions => ['member_id = ?', current_member.id])
      end
      respond_with(@tests)
    else
      redirect_to "/members/sign_in"
    end
  end

  def show
    if  member_signed_in?
      respond_with(@tag)
    else
      redirect_to "/members/sign_in"
    end
  end

  def new
    if  member_signed_in?
      @tag = Tag.new
      respond_with(@tag)
    else
      redirect_to "/members/sign_in"
    end
  end

  def edit
  end

  def create
    if  member_signed_in?
      @tag = Tag.new(tag_params)
      @tag.member_id = current_member.id
      @tag.save
      respond_with(@tag)
    else
      redirect_to "/members/sign_in"
    end
  end

  def update
    if  member_signed_in?
      @tag.update(tag_params)
      respond_with(@tag)
    else
      redirect_to "/members/sign_in"
    end
  end

  def destroy
    if  member_signed_in?
      @tag.destroy
      respond_with(@tag)
    else
      redirect_to "/members/sign_in"
    end
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name, :language_member_id, :member_id)
  end
end
