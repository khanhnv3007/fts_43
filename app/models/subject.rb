class Subject < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :questions, dependent: :destroy
  has_many :exams, dependent: :destroy
end
