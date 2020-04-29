class PagesController < ApplicationController

  def home
    redirect_to articles_path
  end

  def details
  end

end
