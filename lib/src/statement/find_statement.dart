part of query;

class FindStatement implements Statement {
  final Set<Column> _column = new Set<Column>();

  final JoinedTable _fromClause = new JoinedTable();

  final AndExpression _where = new AndExpression();

  int _limit;

  FindStatement();

  FindStatement from(String tableName, [String alias]) {
    _fromClause.from(tableName, alias);
    return this;
  }

  FindStatement join(JoinType joinType, String tableName, [String alias]) {
    _fromClause.join(joinType, tableName, alias);
    return this;
  }

  FindStatement innerJoin(String tableName, [String alias]) {
    _fromClause.innerJoin(tableName, alias);
    return this;
  }

  FindStatement leftJoin(String tableName, [String alias]) {
    _fromClause.leftJoin(tableName, alias);
    return this;
  }

  FindStatement rightJoin(String tableName, [String alias]) {
    _fromClause.rightJoin(tableName, alias);
    return this;
  }

  FindStatement fullJoin(String tableName, [String alias]) {
    _fromClause.fullJoin(tableName, alias);
    return this;
  }

  FindStatement crossJoin(String tableName, [String alias]) {
    _fromClause.crossJoin(tableName, alias);
    return this;
  }

  FindStatement joinOn(Expression exp) {
    _fromClause..joinOn(exp);
    return this;
  }

  FindStatement select(String columnName, [String alias]) {
    _column.add(new Column(columnName, alias));
    return this;
  }

  FindStatement where(Expression exp) {
    _where.and(exp);
    return this;
  }

  FindStatement limit(int val) {
    if(_limit != null) {
      throw new Exception('Already limited!');
    }
    _limit = val;
    return this;
  }

  String toSql() {
    StringBuffer sb = new StringBuffer();
    sb.write('SELECT ');

    if (_column.length == 0) {
      sb.write('* ');
    } else {
      sb.write(_column.map((Column col) => col.toSql()).toList().join(', '));
    }

    sb.write(' FROM ');
    sb.write(_fromClause.toSql());

    if (_where.length != 0) {
      sb.write(' WHERE ');
      sb.write(_where.toSql());
    }

    if(_limit is int) {
      sb.write(' LIMIT $_limit');
    }

    sb.write(';');

    return sb.toString();
  }
}