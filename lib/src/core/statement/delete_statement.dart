part of query;

class DeleteStatement implements Statement {
  String _tableName;

  final AndExpression _where = new AndExpression();

  DeleteStatement();

  DeleteStatement from(String tableName) {
    if (_tableName != null) {
      throw new Exception("Name already assigend!");
    }
    _tableName = tableName;
    return this;
  }

  DeleteStatement where(Expression exp) {
    _where.and(exp);
    return this;
  }

  String toSql() {
    StringBuffer sb = new StringBuffer();

    sb.write('DELETE FROM $_tableName');

    if (_where.length != 0) {
      sb.write(' WHERE ');
      sb.write(_where.toSql());
    }

    sb.write(';');

    return sb.toString();
  }
}
