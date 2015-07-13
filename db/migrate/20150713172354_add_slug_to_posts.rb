class AddSlugToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :slug, :string, required: true
  end
end
