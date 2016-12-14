part of query;

abstract class Expression implements ToSqlable {}

class SExp implements Expression {
  final Q item;

  SExp(this.item);

  String toSql() => item.toSql();
}

class BExp implements Expression {
  final Expression lh;

  final BinaryLogicalOperator op;

  final Expression rh;

  BExp(this.lh, this.op, this.rh);

  String toSql() => '(${lh.toSql()}) ${op.toSql()} (${rh.toSql()})';
}
