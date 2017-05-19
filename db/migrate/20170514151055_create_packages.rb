class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :stargazers_count
      t.integer :forks_count
      t.boolean :fork
      t.string :author
      t.text :description

      t.timestamps
    end
  end
end
