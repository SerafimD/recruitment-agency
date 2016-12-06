class CreateWorkerSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :worker_skills do |t|
      t.belongs_to :worker, foreign_key: true
      t.string :name, unique: true
      t.timestamps
    end
  end
end
