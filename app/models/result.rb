class Result < ActiveRecord::Base
  serialize :content_answer, Array
  belongs_to :exam
  belongs_to :question
  belongs_to :answer
end
