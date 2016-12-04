require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    search_name = params.map { |k,v| k }
    search_value = params.map { |k,v| v }
    where_line = search_name.map { |attr| "#{attr} = ?"}.join(" AND ")
    p where_line
    DBConnection.execute(<<-SQL, *search_value)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        #{where_line}
    SQL
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
