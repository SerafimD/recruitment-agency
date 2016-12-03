class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.string :surname
      t.string :name
      t.string :middle_name
      t.string :email
      t.string :phone
      t.boolean :in_search
      t.integer :salary

      t.timestamps
    end
  end
end
