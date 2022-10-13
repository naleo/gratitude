class GratitudeItemsController < ApplicationController
  before_action :load_gratitude_item, except: [:new, :index, :create]
  # GET /gratitude_items
  def index
    @gratitude_items = GratitudeItem.all
  end

  # GET /gratitude_items/new
  def new
    @gratitude_item = GratitudeItem.new
  end

  # POST /gratitude_items
  def create
    @gratitude_item = GratitudeItem.new params.require(:gratitude_item).permit(:name,:date,:details)
    if @gratitude_item.save
      redirect_to gratitude_items_path, notice: "Gratitude Created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /gratitude_items/:id
  def show; end

  # GET /gratitude_items/:id/edit
  def edit; end

  # PATCH/PUT /gratitude_items/:id
  def update
    if @gratitude_item.update gratitude_item_params
      redirect_to @gratitude_item, notice: "Gratitude was Updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /gratitude_items/:id
  def destroy
    @gratitude_item.destroy
    redirect_to gratitude_items_path, alert: "Gratitude was Deleted"
  end

  private

  def load_gratitude_item
    @gratitude_item = GratitudeItem.find params[:id]
  end

  def gratitude_item_params
    params.require(:gratitude_item).permit(:name,:date,:details)
  end
end
