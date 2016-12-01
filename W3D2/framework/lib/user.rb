require_relative 'question_database'
require_relative 'question'
require 'byebug'

class User < ModelBase
  attr_accessor :fname, :lname

  # def self.find_by_id(id)
  #   data = QuestionDatabase.instance.execute(<<-SQL, id)
  #     SELECT
  #       *
  #     FROM
  #       users
  #     WHERE
  #       id = ?
  #   SQL
  #
  #   raise "User id:#{id} not found" if data.empty?
  #
  #   User.new(data.first)
  # end

  def self.find_by_name(fname, lname)
    data = QuestionDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ?, lname = ?
    SQL

    raise "Cannot find user with name: #{fname} #{lname}" if data.empty?

    data.map { |params| User.new(params) }
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question::find_by_author_id(@id)
  end

  def authored_replies
    Reply::find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow::followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike::liked_questions_for_user_id(@id)
  end

  def average_karma
    data = QuestionDatabase.instance.execute(<<-SQL, @id)
      SELECT
        CAST(COUNT(question_likes.id) AS FLOAT) / COUNT(DISTINCT questions.id) AS average_karma
      FROM
        questions
      LEFT JOIN
        question_likes
      ON
        questions.id = question_likes.question_id
      WHERE
        author_id = ?
    SQL

    return nil if data.empty?

    data.first['average_karma']
  end
  #
  # def save
  #   @id.nil? ? create : update
  # end
  #
  # private
  #
  # def create
  #   QuestionDatabase.instance.execute(<<-SQL, @fname, @lname)
  #     INSERT INTO
  #       users (fname, lname)
  #     VALUES
  #       (?, ?)
  #   SQL
  #   @id = QuestionDatabase.instance.last_insert_row_id
  # end
  #
  # def update
  #   QuestionDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
  #     UPDATE
  #       users
  #     SET
  #       fname = ?, lname = ?
  #     WHERE
  #       id = ?
  #   SQL
  # end


end
