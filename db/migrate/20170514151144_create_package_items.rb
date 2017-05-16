class CreatePackageItems < ActiveRecord::Migration[5.1]
  def change
    create_table :package_items do |t|
      t.string :path
      t.text :description
      t.references :package

      t.timestamps
    end
  end
end
