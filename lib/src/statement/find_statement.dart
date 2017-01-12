part of query;

class OrderBy implements ToSqlable {
  final String columnName;

  final bool ascending;

  const OrderBy(this.columnName, [this.ascending = false]);

  String toSql() => '$columnName ' + (ascending ? 'ASC' : 'DESC');
}

class FindStatement implements Statement {
  final Set<SelColumn> _column = new Set<SelColumn>();

  final JoinedTable _fromClause = new JoinedTable();

  final AndExpression _where = new AndExpression();

  final List<OrderBy> _orderBy = [];

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
    _column.add(new SelColumn(columnName, alias));
    return this;
  }

  FindStatement where(Expression exp) {
    _where.and(exp);
    return this;
  }

  FindStatement orderBy(String column, [bool ascending = false]) {
    _orderBy.add(new OrderBy(column, ascending));
    return this;
  }

  FindStatement orderByMany(List<String> columns, [bool ascending = false]) {
    columns.forEach((String column) {
      _orderBy.add(new OrderBy(column, ascending));
    });
    return this;
  }

  FindStatement limit(int val) {
    if (_limit != null) {
      throw new Exception('Already limited!');
    }
    _limit = val;
    return this;
  }
  
   FindStatement offset(int val) {
    if (_offset != null) {
      throw new Exception('Cant use more than one offset!');
    }
    _offset = val;
    return this;
  }

  String toSql() {
    StringBuffer sb = new StringBuffer();
    sb.write('SELECT ');

    if (_column.length == 0) {
      sb.write('* ');
    } else {
      sb.write(_column.map((SelColumn col) => col.toSql()).toList().join(', '));
    }

    sb.write(' FROM ');
    sb.write(_fromClause.toSql());

    if (_where.length != 0) {
      sb.write(' WHERE ');
      sb.write(_where.toSql());
    }

    if (_orderBy.length != 0) {
      sb.write(' ORDER BY ');
      sb.write(_orderBy.map((OrderBy orderBy) => orderBy.toSql()).join(', '));
    }

    if (_limit is int) {
      sb.write(' LIMIT $_limit');
    }

    if (_offset is int) {
      sb.write(' OFFSET $_limit');
    }
    
    sb.write(';');

    return sb.toString();
  }
}
