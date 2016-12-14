part of query;

class ComparisonOperator implements ToSqlable {
  final int id;

  final String string;

  const ComparisonOperator._(this.id, this.string);

  String toSql() => string;

  static const Eq = const ComparisonOperator._(0, '=');

  static const Ne = const ComparisonOperator._(1, '<>');

  static const Gt = const ComparisonOperator._(2, '>');

  static const GtEq = const ComparisonOperator._(3, '>=');

  static const LtEq = const ComparisonOperator._(4, '<=');

  static const Lt = const ComparisonOperator._(5, '<');
}
