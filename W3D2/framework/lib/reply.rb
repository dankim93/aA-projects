require_relative 'question_database'

class Reply < ModelBase
  attr_accessor :question_id, :parent_reply_id, :author_id, :body
  # 
  # def self.find_by_id(id)
  #   data = QuestionDatabase.instance.execute(<<-SQL, id)
  #     SELECT
  #       *
  #     FROM
  #       replies
  #     WHERE
  #       id = ?
  #   SQL
  #
  #   raise "Reply id:#{id} not found" if data.empty?
  #
  #   Reply.new(data.first)
  # end

  def self.find_by_user_id(user_id)
    data = QuestionDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        author_id = ?
    SQL

    raise "Can not find reply by user_id: #{user_id}" if data.empty?

    Reply.new(data.first)
  end

  def self.find_by_question_id(question_id)
    data = QuestionDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    raise "Can not find replies by question_id: #{question_id}" if data.empty?

    data.map { |params| Reply.new(params) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @author_id = options['author_id']
    @body = options['body']
  end

  def author
    User.find_by_id(@author_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Reply.find_by_id(@parent_reply_id)
  end

  def child_replies
    data = QuestionDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = ?
    SQL

    return nil if data.empty?

    data.map { |params| Reply.new(params) }
  end


  def save
    @id.nil? ? create : update
  end

  private

  def create
    QuestionDatabase.instance.execute(<<-SQL, @question_id, @parent_reply_id, @author_id, @body)
      INSERT INTO
        replies (question_id, parent_reply_id, author_id, body)
      VALUES
        (?, ?, ?, ?)
    SQL
    @id = QuestionDatabase.instance.last_insert_row_id
  end

  def update
    QuestionDatabase.instance.execute(<<-SQL, @question_id, @parent_reply_id, @author_id, @body, @id)
      UPDATE
        replies
      SET
        question_id = ?, parent_reply_id = ?, author_id = ?, body = ?
      WHERE
        id = ?
    SQL
  end
end
