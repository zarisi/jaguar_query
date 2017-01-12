part of query;

abstract class CreateColumn<ValType extends L> implements ToSqlable {
  String _column;
}

abstract class CreateIntColumn extends CreateColumn<LInt> {
  bool _notNull;

  CreateIntColumn();

  CreateIntColumn column(String column) {
    _column = column;
    return this;
  }

  CreateIntColumn notNull() {
    _notNull = true;
    return this;
  }

  String toSql() => 'INT' + (_notNull ? ' NOT NULL' : '');
}

class CreateTableStatement implements Statement {
  String _tableName;

  final List<CreateColumn> _columns = [];

  CreateTableStatement();

  CreateTableStatement table(String tableName) {
    _tableName = tableName;
    return this;
  }

  CreateTableStatement column(CreateColumn column) {
    _columns.add(column);
    return this;
  }

  CreateTableStatement columns(List<CreateColumn> columns) {
    _columns.addAll(columns);
    return this;
  }

  String toSql() {
    StringBuffer sb = new StringBuffer();

    sb.write('CREATE TABLE $_tableName (');

    sb.write(_columns.map((CreateColumn col) => col.toSql()).join(', '));

    sb.write(')');

    return sb.toString();
  }
}
