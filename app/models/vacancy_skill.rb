class VacancySkill < ApplicationRecord
  validates :name, uniqueness: { scope: :vacancy_id,
                                 message: 'Skill must be uniq for one vacancy'}
  belongs_to :vacancy
end
