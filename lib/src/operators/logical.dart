part of query;

class BinaryLogicalOperator implements ToSqlable {
  final int id;

  final String string;

  const BinaryLogicalOperator._(this.id, this.string);

  String toSql() => string;

  static const BinaryLogicalOperator And =
      const BinaryLogicalOperator._(0, 'AND');

  static const BinaryLogicalOperator Or =
      const BinaryLogicalOperator._(1, 'OR');
}
