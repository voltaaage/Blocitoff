class ItemsController < ApplicationController
  def create
    @item = current_user.items.new(item_params)
    @item.completed = false
    authorize @item
    if @item.save
      flash[:notice] = "To Do Item was saved"
      redirect_to [current_user]
    else
      flash[:error] = "There was an error saving the item"
      redirect_to [current_user]
    end
  end

  def show
    @user = current_user
  end

  def destroy
    @item = Item.find(params[:id])
    authorize @item
    if @item.destroy
      flash[:notice] = "Item deleted successfully."
    else
      flash[:error] = "There was an error deleting item."
    end

    respond_to do |format|
      format.html
      format.js 
    end
    
  end

  def complete
    @item = Item.find(params[:item_id])
    authorize @item
    @item.mark_as_complete
    if @item.save
      flash[:notice] = "Item was completed successfully."
    else
      flash[:error] = "There was an error completing the item."
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :due_date)
  end
end
