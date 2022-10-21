class ReflectionsController < ApplicationController
  before_action :load_gratitude_item


  def index
  end
  
  def new
    @reflection = Reflection.new
  end
  
  def create
    @reflection = Reflection.new reflection_params
    if @gratitude_item.reflections << @reflection
      redirect_to gratitude_item_reflection_path(@gratitude_item,@reflection), notice: "Reflection Created"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  
  private
  
  def reflection_params
    params.require(:reflection).permit(:body, :reflection_date)
  end
  
  def load_gratitude_item
    @gratitude_item = GratitudeItem.find params[:gratitude_item_id]
  end

end
