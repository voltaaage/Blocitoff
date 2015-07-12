class Item < ActiveRecord::Base
  belongs_to :user

  def complete_task
    self.completed = true
  end

end
