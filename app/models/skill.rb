class Skill < ApplicationRecord
  validates :name, uniqueness: true
end
