class Worker < ApplicationRecord
  validates :name, :contact, presence: true
  validates :salary, numericality: {greater_than: 0}
  validates :name, format: {
      with: %r{[А-ЯЁ][а-яё]+ [А-ЯЁ][а-яё]+ [А-ЯЁ][а-яё]+},
      message: 'Имя должно состоять из 3-х слов на кириллице'
  }
end
