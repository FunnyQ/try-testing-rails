class AddDownvotesToLinks < ActiveRecord::Migration
  def change
    add_column :links, :downvotes, :integer, default: 0
  end
end
