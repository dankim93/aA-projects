class ModelBase

  def self.pluralize_name
    table_name = self.name.downcase
    case table_name[-1]
    when 'y' then table_name[0...-1] + 'ies'
    when 'h' then table_name + 'es'
    else table_name + 's'
    end
  end

  def self.find_by_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{self.pluralize_name}
      WHERE
        id = ?
    SQL

    raise "#{self.name} id:#{id} not found" if data.empty?

    self.new(data.first)
  end

  def self.all
    data = QuestionDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.pluralize_name}
    SQL

    data.map { |params| self.new(params) }
  end


  def save
    @id.nil? ? create : update
  end

  private

  def create
    inst_vars = self.instance_variables.map(&:to_s).reject { |var| var == '@id' } #@name
    # inst_vars_str = inst_vars.join(', ')
    vars = inst_vars.map { |var| var[1..-1] }
    vars_str = vars.join(', ') #name
    variables_values = vars.map { |var| self.send(var) } #values

    QuestionDatabase.instance.execute(<<-SQL, variables_values )
      INSERT INTO
        #{self.class.pluralize_name} (#{vars_str})
      VALUES
        (?, ?)
    SQL

    @id = QuestionDatabase.instance.last_insert_row_id
  end

  def update
    QuestionDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
  end
end
