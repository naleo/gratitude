class GratitudeItemsController < ApplicationController
  
    def index
        @gratitude_items = GratitudeItem.all
    end
    
    def new
        @gratitude_item = GratitudeItem.new
    end
    
    def create
        @gratitude_item = GratitudeItem.new params.require(:gratitude_item).permit(:name,:date,:details)
        if @gratitude_item.save
          redirect_to gratitude_items_path, notice: "Gratitude Created."
        else
          render :new, status: :unprocessable_entity
        end
    end
    
    private
    
    def gratitude_item_params
      params.require(:gratitude_item).permit(:name,:date,:details)
    end

end
