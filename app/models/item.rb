class Item < ActiveRecord::Base
  belongs_to :user

  def complete_task?
    update_attribute(:completed, true)
    update_attribute(:completion_date, Date.today)
  end

  def days_left
    7 - (DateTime.now.to_date - created_at.to_date).to_i
  end

end
