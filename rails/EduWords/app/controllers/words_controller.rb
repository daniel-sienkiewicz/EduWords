class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    if  member_signed_in?
      if current_member.role == 'admin'
        @words = Word.all
      else
        @words = Word.find(:all, :conditions => ['member_id = ?', current_member.id])
      end
      respond_with(@tests)
    elsif params[:u] != ""
      @member = Member.find(:all, :conditions => ['email = ?', params[:u]]).first
      @words = Word.find(:all, :conditions => ['member_id = ?', @member.id])
    else
      redirect_to "/members/sign_in"
    end
  end

  def show
    if  member_signed_in?
      respond_with(@word)
    else
      redirect_to "/members/sign_in"
    end
  end

  def new
    if  member_signed_in?
      @word = Word.new
      @all_tags = Tag.find(:all, :conditions => ['member_id = ?', current_member.id])
      @all_languages = Language.find(:all, :conditions => ['member_id = ?', current_member.id])
      respond_with(@word)
    else
      redirect_to "/members/sign_in"
    end
  end

  def edit
    if  member_signed_in?
      @all_tags = Tag.find(:all, :conditions => ['member_id = ?', current_member.id])
      @all_languages = Language.find(:all, :conditions => ['member_id = ?', current_member.id])
    else
      redirect_to "/members/sign_in"
    end
  end

  def create
    if  member_signed_in?
      @word = Word.new(word_params)
      @word.member_id = current_member.id
      @word.save
      respond_with(@word)
    else
      redirect_to "/members/sign_in"
    end
  end

  def update
    if  member_signed_in?
      @word.update(word_params)
      respond_with(@word)
    else
      redirect_to "/members/sign_in"
    end
  end

  def destroy
    if  member_signed_in?
      @word.destroy
      respond_with(@word)
    else
      redirect_to "/members/sign_in"
    end
  end

  def download
    if  member_signed_in?
      @words = Word.find(:all, :conditions => ['member_id = ?', current_member.id])
      wordsy = ""
      i = 0;

      @words.each do |word|
        i = i + 1
        wordsy += i.to_s + "." + " " + word.namelanguage1 + " " + word.namelanguage2 + " " + Language.find(word.language1_id).name + " " + Language.find(word.language2_id).name + "\n"
      end

      send_data(wordsy, :filename => "EduWords.txt")
    else
      redirect_to "/members/sign_in"
    end
  end

  private

  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:namelanguage1, :namelanguage2, :member_id, :language1_id, :language2_id, tag_ids: [])
  end
end
