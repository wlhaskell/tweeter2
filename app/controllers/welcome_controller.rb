class WelcomeController < ApplicationController
  def index
  	 @twits = Twit.all.reverse_order
  end
end
