class AddReadmeToPackage < ActiveRecord::Migration[5.1]
  def change
    add_column :packages, :readme, :text
  end
end
