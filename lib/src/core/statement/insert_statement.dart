part of query;

class InsertStatement implements Statement {
  String _tableName;

  final Map<String, L> _values = {};

  InsertStatement();

  InsertStatement into(String tableName) {
    if (_tableName != null) {
      throw new Exception("Name already assigend!");
    }
    _tableName = tableName;
    return this;
  }

  InsertStatement set(SetColumn column) {
    setValue(column._column, column._value);
    return this;
  }

  InsertStatement setMany(List<SetColumn> columns) {
    columns.forEach((SetColumn column) {
      setValue(column._column, column._value);
    });
    return this;
  }

  InsertStatement setValue(String column, L value) {
    _values[column] = value;
    return this;
  }

  InsertStatement setValues(Map<String, L> values) {
    _values.addAll(values);
    return this;
  }

  String toSql() {
    StringBuffer sb = new StringBuffer();

    sb.write('INSERT INTO $_tableName (');

    sb.write(_values.keys.join(', '));

    sb.write(') VALUES (');
    sb.write(_values.values.map((L val) => val.toSql()).join(', '));
    sb.write(');');

    return sb.toString();
  }
}
