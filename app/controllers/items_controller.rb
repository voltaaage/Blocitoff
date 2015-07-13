class ItemsController < ApplicationController
  def create
    @item = current_user.items.new(item_params)
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
    @user = @item.user
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
    @item = Item.find(params[:id])
    # try completing the item in here
    if @item.complete_task
      flash[:notice] = "Item deleted successfully."
      redirect_to [@user]
    else
      flash[:error] = "There was an error deleting item."
      redirect_to [@user]
    end

  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :due_date)
  end
end
