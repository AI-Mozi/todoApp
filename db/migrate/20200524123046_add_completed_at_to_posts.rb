class AddCompletedAtToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :completed_at, :datetime
  end
end
