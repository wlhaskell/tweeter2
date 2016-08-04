class WelcomeController < ApplicationController
  def index
  	@twits = Twit.all
  	@twit = Twit.new
  end
end
