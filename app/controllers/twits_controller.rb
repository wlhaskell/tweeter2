class TwitsController < ApplicationController
  before_action :set_twit, only: [:show, :edit, :update, :destroy]

  # GET /twits
  # GET /twits.json
  def index
    #@twits = Twit.all
    @tag = Tag.find(params[:id])
  end

  # GET /twits/1
  # GET /twits/1.json
  def show
  end

  # GET /twits/new
  def new
    @twit = Twit.new
  end

  # GET /twits/1/edit
  def edit
  end

  # POST /twits
  # POST /twits.json
  def create
    @twit = Twit.create(twit_params)
    content = @twit.content.split

    content.each_with_index do |word, index|
      if word[0] == '#'
        if Tag.pluck(:phrase).include?(word)
          tag = Tag.find_by(phrase: word)
        else
          tag = Tag.create(phrase: word)
        end
        tag_twits = TagTwit.create(twit_id: @twit.id, tag_id: tag.id)
        content[index] = "<a href='/tag?id=#{tag.id}'>#{word}</a>"
      end
    end

    @twit.content = content.join(' ')

    respond_to do |format|
      if @twit.save
        @twits = Twit.all.reverse_order
        format.js
        format.html { redirect_to @twit, notice: 'Twit was successfully created.' }
        format.json { render :show, status: :created, location: @twit }
      else
        format.html { render :new }
        format.json { render json: @twit.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /twits/1
  # PATCH/PUT /twits/1.json
  def update
    respond_to do |format|
      if @twit.update(twit_params)
        format.html { redirect_to @twit, notice: 'Twit was successfully updated.' }
        format.json { render :show, status: :ok, location: @twit }
      else
        format.html { render :edit }
        format.json { render json: @twit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twits/1
  # DELETE /twits/1.json
  def destroy
    @twit.destroy
    respond_to do |format|
      format.html { redirect_to twits_url, notice: 'Twit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twit
      @twit = Twit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twit_params
      params.require(:twit).permit(:content, :user_id)
    end
end
