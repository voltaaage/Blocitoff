class Item < ActiveRecord::Base
  belongs_to :user

  def mark_as_complete
    update(completed: true)
    update(completion_date: Date.today)
  end

  def days_left
    7 - (DateTime.now.to_date - created_at.to_date).to_i
  end

end
