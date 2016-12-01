require_relative 'question_database'

class QuestionLike
  attr_accessor :user_id, :question_id

  def self.find_by_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL

    raise "QuestionLike id:#{id} not found" if data.empty?

    QuestionLike.new(data.first)
  end

  def self.likers_for_question_id(question_id)
    data = QuestionDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        question_likes
      JOIN
        users ON question_likes.user_id = users.id
      WHERE
        question_id = ?
    SQL

    return nil if data.empty?
    data.map { |params| User.new(params) }

  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*) AS num_likes
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL

    return data.first['num_likes']
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        user_id = ?
    SQL

    return nil if data.empty?
    data.map { |params| Question.new(params) }
  end

  def self.most_liked_questions(n)
    data = QuestionDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*,
        COUNT(*) AS liked_count
      FROM
        question_likes
      JOIN
        questions
      ON
        questions.id = question_likes.question_id
      GROUP BY
        questions.id
      ORDER BY
        liked_count DESC
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
