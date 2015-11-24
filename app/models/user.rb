class User < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :exams, dependent: :destroy
  enum role: [:user,:admin]

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
end
