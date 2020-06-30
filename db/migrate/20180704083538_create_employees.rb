class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.integer :company_id
      t.string  :title
      t.string  :name
      t.timestamps
    end
  end
end
