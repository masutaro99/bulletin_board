class CheckController < ApplicationController
  def index
    @contacts = Contact.all
  end
end
