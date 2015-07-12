class AddAttributesToItems < ActiveRecord::Migration
  def change
    add_column :items, :category, :string
    add_column :items, :completed, :boolean
    add_column :items, :completion_date, :date
  end
end
