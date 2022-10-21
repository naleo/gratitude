class ReflectionsController < ApplicationController
  before_action :load_gratitude_item


  def index
  end
  
  def new
    @reflection = Reflection.new
  end
  
  private
  def load_gratitude_item
    @gratitude_item = GratitudeItem.find params[:gratitude_item_id]
  end

end
