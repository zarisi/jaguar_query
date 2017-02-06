part of query;

class OrderBy implements ToSqlable {
  final String columnName;

  final bool ascending;

  const OrderBy(this.columnName, [this.ascending = false]);

  String toSql() => '$columnName ' + (ascending ? 'ASC' : 'DESC');
}

class FindStatement implements Statement {
  final Set<SelColumn> _column = new Set<SelColumn>();

  TableName _from;

  final List<JoinedTable> _joins = [];

  JoinedTable _curJoin;

  final AndExpression _where = new AndExpression();

  final List<OrderBy> _orderBy = [];

  final List<String> _groupBy = [];

  int _limit;

  int _offset;

  FindStatement();

  FindStatement from(String tableName, [String alias]) {
    if (_from != null) {
      throw new Exception('From table already specified!');
    }
    _from = new TableName(tableName, alias);
    return this;
  }

  FindStatement join(JoinedTable join) {
    if (join == null) {
      throw new Exception('Join cannot be null!');
    }
    _curJoin = join;
    _joins.add(_curJoin);
    return this;
  }

  FindStatement innerJoin(String tableName, [String alias]) {
    _curJoin = new JoinedTable.innerJoin(tableName, alias);
    _joins.add(_curJoin);
    return this;
  }

  FindStatement leftJoin(String tableName, [String alias]) {
    _curJoin = new JoinedTable.leftJoin(tableName, alias);
    _joins.add(_curJoin);
    return this;
  }

  FindStatement rightJoin(String tableName, [String alias]) {
    _curJoin = new JoinedTable.rightJoin(tableName, alias);
    _joins.add(_curJoin);
    return this;
  }

  FindStatement fullJoin(String tableName, [String alias]) {
    _curJoin = new JoinedTable.fullJoin(tableName, alias);
    _joins.add(_curJoin);
    return this;
  }

  FindStatement crossJoin(String tableName, [String alias]) {
    _curJoin = new JoinedTable.crossJoin(tableName, alias);
    _joins.add(_curJoin);
    return this;
  }

  FindStatement joinOn(Expression exp) {
    if (_curJoin == null) {
      throw new Exception('No joins in the join stack!');
    }
    _curJoin.joinOn(exp);
    return this;
  }

  FindStatement select(String columnName, [String alias]) {
    _column.add(new SelColumn(columnName, alias));
    return this;
  }

  FindStatement count(String columnName, [String alias, bool isDistinct]) {
    _column.add(new CountSelColumn(columnName, alias, isDistinct));
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

  FindStatement groupBy(String val) {
    _groupBy.add(val);
    return this;
  }

  FindStatement groupByMany(List<String> columns) {
    _groupBy.addAll(columns);
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
    sb.write(_from.toSql());

    for (JoinedTable tab in _joins) {
      sb.write(' ');
      sb.write(tab.toSql());
    }

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
      sb.write(' OFFSET $_offset');
    }

    if (_groupBy.length != 0) {
      sb.write(' GROUP BY ');
      sb.write(_groupBy.map((String groupBy) => groupBy).join(', '));
    }

    sb.write(';');

    return sb.toString();
  }
}
