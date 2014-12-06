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
    end
  end

  def show
    respond_with(@word)
  end

  def new
    @word = Word.new
    @all_tags = Tag.all
    @all_languages = Language.all
    respond_with(@word)
  end

  def edit
        @all_tags = Tag.all
    @all_languages = Language.all
  end

  def create
    @word = Word.new(word_params)
    @word.member_id = current_member.id
    @word.save
    respond_with(@word)
  end

  def update
    @word.update(word_params)
    respond_with(@word)
  end

  def destroy
    @word.destroy
    respond_with(@word)
  end
  
  def download
    @words = Word.find(:all, :conditions => ['member_id = ?', current_member.id])
    wordsy = ""
    i = 0;

    @words.each do |word|
      i = i + 1
      wordsy += i.to_s + "." + " " + word.namelanguage1 + " " + word.namelanguage2 + " " + Language.find(word.language1_id).name + " " + Language.find(word.language2_id).name + "\n"
    end


    send_data(wordsy, :filename => "EduWords.txt")
  end

  private

  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:namelanguage1, :namelanguage2, :member_id, :language1_id, :language2_id, tag_ids: [])
  end
end
