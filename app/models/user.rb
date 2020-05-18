class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :myquestions, dependent: :destroy
  has_many :pins, dependent: :destroy
  has_many :questions, through: :pins

  def like(question)
    @pins = pins.find_or_create_by(question_id: question.id)
  end

  def unlike(question)
    pin = pins.find_by(question_id: question.id)
    pin.destroy if pin
  end

end
