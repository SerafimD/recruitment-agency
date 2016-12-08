class WorkerSkill < ApplicationRecord
  validates :name, uniqueness: { scope: :worker_id,
    message: 'Skill must be uniq for one worker'}
  belongs_to :worker
end
