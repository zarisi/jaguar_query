part of query;

/// A SQL join type that can be used in 'SELECT' statements
class JoinType implements ToSqlable {
  /// Identification code for this join type
  final int id;

  /// String representation of this join type
  final String string;

  const JoinType._(this.id, this.string);

  String toSql() => string;

  /// 'INNER JOIN' join type
  static const JoinType InnerJoin = const JoinType._(0, 'INNER JOIN');

  /// 'LEFT JOIN' join type
  static const JoinType LeftJoin = const JoinType._(1, 'LEFT JOIN');

  /// 'RIGHT JOIN' join type
  static const JoinType RightJoin = const JoinType._(2, 'RIGHT JOIN');

  /// 'FULL JOIN' join type
  static const JoinType FullJoin = const JoinType._(3, 'FULL JOIN');

  /// 'CROSS JOIN' join type
  static const JoinType CrossJoin = const JoinType._(4, 'CROSS JOIN');
}

/// Table selector
abstract class Table implements ToSqlable {}

/// TableName
class TableName implements Table {
  final String tableName;

  final String alias;

  TableName(this.tableName, [this.alias]);

  String toSql() {
    String ret = '$tableName';
    if (alias is String) {
      ret += ' $alias';
    }
    return ret;
  }
}

class JoinedTable implements Table {
  final JoinType _type;

  final TableName _to;

  AndExpression _on = new AndExpression();

  JoinedTable(this._type, String tableName, [String alias])
      : _to = new TableName(tableName, alias);

  factory JoinedTable.innerJoin(String tableName, [String alias]) =>
      new JoinedTable(JoinType.InnerJoin, tableName, alias);

  factory JoinedTable.leftJoin(String tableName, [String alias]) =>
      new JoinedTable(JoinType.LeftJoin, tableName, alias);

  factory JoinedTable.rightJoin(String tableName, [String alias]) =>
      new JoinedTable(JoinType.RightJoin, tableName, alias);

  factory JoinedTable.fullJoin(String tableName, [String alias]) =>
      new JoinedTable(JoinType.FullJoin, tableName, alias);

  factory JoinedTable.crossJoin(String tableName, [String alias]) =>
      new JoinedTable(JoinType.CrossJoin, tableName, alias);

  JoinedTable joinOn(Expression onExp) {
    if (_type == null || _to == null) {
      throw new Exception('Query has no join on it!');
    }

    _on.and(onExp);

    return this;
  }

  void validate() {
    if (_to == null) {
      if (_type != null || _on.length != 0) {
        throw new Exception('Join not initialized properly!');
      }
    } else {
      if (_type == null || _on.length == 0) {
        throw new Exception('Join not initialized properly!');
      }
    }
  }

  String toSql() {
    validate();

    StringBuffer sb = new StringBuffer();

    sb.write('${_type.toSql()} ${_to.toSql()}');

    if (_on.length != 0) {
      sb.write(' ON ${_on.toSql()}');
    }

    return sb.toString();
  }
}
