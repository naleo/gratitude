class ReflectionsController < ApplicationController
  before_action :authenticate
  before_action :load_gratitude_item
  before_action :load_reflection, except: %i[index new create]

  def index; end

  def new
    @reflection = Reflection.new
  end

  def create
    @reflection = Reflection.new reflection_params
    if @gratitude_item.reflections << @reflection
      redirect_to gratitude_item_reflections_path(@gratitude_item), notice: 'Reflection Created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @reflection.update reflection_params
      redirect_to gratitude_item_reflections_path(@gratitude_item), notice: 'Reflection Updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reflection.destroy
    redirect_to gratitude_item_reflections_path(@gratitude_item), alert: 'Reflection Deleted.'
  end

  private

  def reflection_params
    params.require(:reflection).permit(:body, :reflection_date, :title)
  end

  def load_gratitude_item
    @gratitude_item = current_user.gratitude_items.find params[:gratitude_item_id]
  end

  def load_reflection
    @reflection = @gratitude_item.reflections.find params[:id]
  end
end
