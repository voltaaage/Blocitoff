class Item < ActiveRecord::Base
  belongs_to :user

  def complete_task
    completed = true
    description = "completed"
  end

end
