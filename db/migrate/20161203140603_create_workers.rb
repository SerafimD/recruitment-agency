class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.text :contact
      t.boolean :in_search
      t.integer :salary

      t.timestamps
    end
  end
end
