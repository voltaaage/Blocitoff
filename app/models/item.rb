class Item < ActiveRecord::Base
  belongs_to :user

  def complete_task?
    update_attribute(:completed, true)
    update_attribute(:completion_date, Date.today)
  end

end
