require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :js, :json

  include Responder
  include CustomDevise
  layout :set_layout
  before_action :load_color

  def load_color
    @color = %w(pink red purple indigo blue cyan teal green lime yellow orange brown grey).sample
  end

  protected

  def set_layout
    if user_signed_in?
      "application"
    else
      devise_controller? ? "login" : "blank"
    end
  end

end
