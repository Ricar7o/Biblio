class AddRemoteCoverToBooks < ActiveRecord::Migration
  def change
    add_column :books, :remote_cover, :string
  end
end
