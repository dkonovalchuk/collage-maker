class StaticPagesController < ApplicationController
  layout false

  def index
  end

  def preview
    render "static_pages/preview", locals: { menu_title: params[:menu_title], items: params[:items] }
  end
end
