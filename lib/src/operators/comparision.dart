part of query;

/// Relational comparision operator
class ComparisonOperator implements ToSqlable {
  /// Identification code for this comparision operator
  final int id;

  /// String representation of this comparision operator
  final String string;

  const ComparisonOperator._(this.id, this.string);

  String toSql() => string;

  /// 'is equal to' relational comparision operator
  static const Eq = const ComparisonOperator._(0, '=');

  /// 'is not equal to' relational comparision operator
  static const Ne = const ComparisonOperator._(1, '<>');

  /// 'is greater than' relational comparision operator
  static const Gt = const ComparisonOperator._(2, '>');

  /// 'is greater than or equal to' relational comparision operator
  static const GtEq = const ComparisonOperator._(3, '>=');

  /// 'is less than or equal to' relational comparision operator
  static const LtEq = const ComparisonOperator._(4, '<=');

  /// 'is less than' relational comparision operator
  static const Lt = const ComparisonOperator._(5, '<');

  /// 'is like' relational comparision operator
  static const Like = const ComparisonOperator._(6, 'LIKE');
}
