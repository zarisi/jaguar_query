part of query;

abstract class Expression implements ToSqlable {}

/// A scalar expression containing only one query item
///
/// (<field> <operation> <value>)
class SExp implements Expression {
  final Q item;

  SExp(this.item);

  String toSql() => item.toSql();
}

/// A binary expression
///
/// (<field> <operation> <value>) op (<field> <operation> <value>)
class BExp implements Expression {
  final Expression lh;

  final BinaryLogicalOperator op;

  final Expression rh;

  BExp(this.lh, this.op, this.rh);

  String toSql() => '(${lh.toSql()}) ${op.toSql()} (${rh.toSql()})';
}
