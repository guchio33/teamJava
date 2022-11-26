class CreateSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :grade
      t.references :department, null: false, foreign_key: true
      t.references :faculty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
