class Worker < ApplicationRecord
  has_many :worker_skills, dependent: :destroy
  validates :name, :contact, presence: true
  validates :name, format: {
      with: %r{[А-ЯЁ][а-яё]+ [А-ЯЁ][а-яё]+ [А-ЯЁ][а-яё]+},
      message: 'Имя должно состоять из 3-х слов на кириллице'
  }
  validates :contact, format: {
      with: %r{([-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4})|(((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10})},
      message: 'Отсутствует почта или телефон'
  }
  validates :salary, numericality: {greater_than: 0}

end
