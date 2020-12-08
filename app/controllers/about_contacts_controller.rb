class AboutContactsController < ApplicationController
  def about
    @about = AboutContact.first
  end

  def contact
    @contact = AboutContact.first
  end
end
