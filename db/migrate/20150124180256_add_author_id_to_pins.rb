class AddAuthorIdToPins < ActiveRecord::Migration
  def change
    add_column :pins, :author_id, :integer
  end
end
