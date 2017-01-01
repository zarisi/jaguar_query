part of query;

/// Binary logical operator
class BinaryLogicalOperator implements ToSqlable {
  /// Identification code for this binary logical operator
  final int id;

  /// String representation of this binary logical operator
  final String string;

  const BinaryLogicalOperator._(this.id, this.string);

  String toSql() => string;

  /// 'logical and' operator
  static const BinaryLogicalOperator And =
      const BinaryLogicalOperator._(0, 'AND');

  /// 'logical or' operator
  static const BinaryLogicalOperator Or =
      const BinaryLogicalOperator._(1, 'OR');
}
