class Question < ActiveRecord::Base
  has_many :answer_choices,
  primary_key: :id,
  foreign_key: :question_id,
  class_name: :AnswerChoice

  belongs_to :poll,
  primary_key: :id,
  foreign_key: :poll_id,
  class_name: :Poll

  has_many :responses,
  through: :answer_choices,
  source: :responses



  # def results
  #   arr = answer_choices
  #   out = {}
  #   arr.each do |answer_choice|
  #     out[answer_choice.text] = answer_choice.responses.length
  #   end
  #   out
  # end
  def results
    arr = self.answer_choices.includes(:responses)
    out = {}
    arr.each do |answer_choice|
      out[answer_choice.text] = answer_choice.responses.length
    end
    out
  end

  def print1
    print 'hello'
  end
end
