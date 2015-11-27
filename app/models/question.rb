class Question < ActiveRecord::Base
  include StateAble

  belongs_to :subject
  belongs_to :user
  enum status: {waiting: 0, approved: 1, edited: 2}

  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :exams, through: :results

  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc {|answer| answer[:content].blank?}

  validates :content, presence: true
end
