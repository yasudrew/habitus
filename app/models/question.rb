class Question < ApplicationRecord
  has_many :pins, foreign_key: 'question_id', dependent: :destroy
  has_many :users, through: :pins


end
