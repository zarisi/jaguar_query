part of query;

class UpdateStatement implements Statement {
  String _tableName;

  final Map<String, V> _values = {};

  final AndExpression _where = new AndExpression();

  UpdateStatement();

  UpdateStatement into(String tableName) {
    if(_tableName != null) {
      throw new Exception("Name already assigend!");
    }
    _tableName = tableName;
    return this;
  }

  UpdateStatement setValue(String column, V value) {
    _values[column] = value;
    return this;
  }

  UpdateStatement setValues(Map<String, V> values) {
    _values.addAll(values);
    return this;
  }

  UpdateStatement where(Expression exp) {
    _where.and(exp);
    return this;
  }

  String toSql() {
    StringBuffer sb = new StringBuffer();

    sb.write('UPDATE $_tableName SET ');

    sb.write(_values.keys.map((String key) => '$key=${_values[key].toSql()}').join(', '));

    if (_where.length != 0) {
      sb.write(' WHERE ');
      sb.write(_where.toSql());
    }

    sb.write(';');

    return sb.toString();
  }
}