require_relative 'question_database'
require_relative 'user'

class QuestionFollow
  attr_accessor :user_id, :question_id

  def self.find_by_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL

    raise "Question Follow id:#{id} not found" if data.empty?

    QuestionFollow.new(data.first)
  end

  def self.followers_for_question_id(question_id)
    # This will return an array of User objects!
    data = QuestionDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        question_follows
      JOIN
        users
      ON
        users.id = question_follows.user_id
      WHERE
        question_id = ?
    SQL

    return nil if data.empty?

    data.map { |params| User.new(params) }
  end

  def self.followed_questions_for_user_id(user_id)
    # Returns an array of Question objects
    data = QuestionDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        question_follows
      JOIN
        questions
      ON
        questions.id = question_follows.question_id
      WHERE
        user_id = ?
    SQL

    return nil if data.empty?

    data.map { |params| Question.new(params) }
  end

  def self.most_followed_questions(n)
    data = QuestionDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*,
        COUNT(*) AS followers_count
      FROM
        question_follows
      JOIN
        questions
      ON
        questions.id = question_follows.question_id
      GROUP BY
        questions.id
      ORDER BY
        followers_count DESC
      LIMIT
        ?
    SQL

    return nil if data.empty?

    data.map { |params| Question.new(params) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end
