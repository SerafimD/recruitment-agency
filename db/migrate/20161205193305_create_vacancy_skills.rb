class CreateVacancySkills < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancy_skills do |t|
      t.belongs_to :vacancy, foreign_key: true
      t.string :name, unique: true
      t.timestamps
    end
  end
end
