class CreateVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancies do |t|
      t.string :name
      t.datetime :addition_date
      t.datetime :duration
      t.integer :salary
      t.text :contact

      t.timestamps
    end
  end
end
