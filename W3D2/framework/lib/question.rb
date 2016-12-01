require_relative 'question_database'


class Question < ModelBase
  attr_accessor :title, :body, :author_id

  def self.most_liked(n)
    QuestionLike::most_liked_questions(n)
  end

  def self.most_followed(n)
    QuestionFollow::most_followed_questions(n)
  end
  #
  # def self.find_by_id(id)
  #   data = QuestionDatabase.instance.execute(<<-SQL, id)
  #     SELECT
  #       *
  #     FROM
  #       questions
  #     WHERE
  #       id = ?
  #   SQL
  #
  #   raise "Question id:#{id} not found" if data.empty?
  #
  #   Question.new(data.first)
  # end

  def self.find_by_author_id(author_id)
    data = QuestionDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL

    raise "Could not find question with author_id: #{author_id}" if data.empty?

    data.map { |params| Question.new(params) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    User.find_by_id(@author_id)
  end

  def replies
    Reply::find_by_question_id(@id)
  end

  def followers
    QuestionFollow::followers_for_question_id(@id)
  end

  def likers
    QuestionLike::likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike::num_likes_for_question_id(@id)
  end

  def save
    @id.nil? ? create : update
  end

  private

  def create
    QuestionDatabase.instance.execute(<<-SQL, @title, @body, @author_id)
      INSERT INTO
        questions (title, body, author_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = QuestionDatabase.instance.last_insert_row_id
  end

  def update
    QuestionDatabase.instance.execute(<<-SQL, @title, @body, @author_id, @id)
      UPDATE
        questions
      SET
        title = ?, body = ?, author_id = ?
      WHERE
        id = ?
    SQL
  end

end
