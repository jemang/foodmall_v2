module Responder
  extend ActiveSupport::Concern

  included do
    responders :flash, :http_cache
  end

  def respond_with_save(object, option={})
    if option[:default]
      respond_with(object) do |format|
        format.js { render "application/save", locals: {object: object}}
      end
    else
      respond_with(object) do |format|
        format.js { render :save, locals: {object: object}}
      end
    end
  end
  

end