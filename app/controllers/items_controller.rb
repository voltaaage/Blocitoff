class ItemsController < ApplicationController
  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = "To Do Item was saved"
      redirect_to [current_user]
    else
      flash[:error] = "There was an error saving the item"
      redirect_to [current_user]
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :due_date)
  end
end
