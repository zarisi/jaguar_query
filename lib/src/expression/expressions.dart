part of query;

abstract class Expression implements ToSqlable {
  const Expression();

  AndExpression operator &(Expression other) {
    return and(other);
  }

  @checked
  AndExpression and(Expression exp);

  OrExpression operator |(Expression other) {
    return or(other);
  }

  @checked
  OrExpression or(Expression exp);
}

/// Condition encapsulates a conditional expression
///
/// (<field> <operation> <value>)
class C<ValType extends V> extends Expression {
  final String field;

  final ComparisonOperator op;

  final ValType value;

  const C(this.field, this.op, this.value);

  static C eq<ValType extends V> (String field, ValType value) =>
      new C(field, ComparisonOperator.Eq, value);

  static C ne<ValType extends V> (String field, ValType value) =>
      new C(field, ComparisonOperator.Ne, value);

  static C gt<ValType extends V> (String field, ValType value) =>
      new C(field, ComparisonOperator.Gt, value);

  static C gtEq<ValType extends V> (String field, ValType value) =>
      new C(field, ComparisonOperator.GtEq, value);

  static C ltEq<ValType extends V> (String field, ValType value) =>
      new C(field, ComparisonOperator.LtEq, value);

  static C lt<ValType extends V> (String field, ValType value) =>
      new C(field, ComparisonOperator.Lt, value);

  static C like(String field, VString value) =>
      new C(field, ComparisonOperator.Like, value);

  static AndExpression inBetween<ValType extends V>(String field, ValType low, ValType high) =>
      new AndExpression()..and(C.gt(field, low))..and(C.lt(field, high));

  @checked
  AndExpression and(Expression exp) {
    if(exp is AndExpression) {
      return exp.and(this);
    }

    AndExpression ret = new AndExpression();
    ret.and(this);
    ret.and(exp);

    return ret;
  }

  @checked
  OrExpression or(Expression exp) {
    if(exp is OrExpression) {
      return exp.or(this);
    }

    OrExpression ret = new OrExpression();
    ret.or(this);
    ret.or(exp);

    return ret;
  }

  String toSql() => '($field ${op.toSql()} ${value.toSql()})';
}

class AndExpression extends Expression {
  final List<Expression> _expressions = [];

  AndExpression();

  int get length => _expressions.length;

  @checked
  AndExpression and(Expression exp) {
    if(exp is AndExpression) {
      _expressions.addAll(exp._expressions);
    } else {
      _expressions.add(exp);
    }

    return this;
  }

  @checked
  OrExpression or(Expression exp) {
    //TODO
  }

  String toSql() => '(' + _expressions
      .map((Expression exp) => exp.toSql())
      .join(' ' + BinaryLogicalOperator.And.toSql() + ' ') + ')';
}

class OrExpression extends Expression {
  final List<Expression> _expressions = [];

  OrExpression();

  int get length => _expressions.length;

  @checked
  AndExpression and(Expression exp) {

  }

  @checked
  OrExpression or(Expression exp) {
    if(exp is OrExpression) {
      _expressions.addAll(exp._expressions);
    } else {
      _expressions.add(exp);
    }

    return this;
  }

  String toSql() => '(' + _expressions
      .map((Expression exp) => exp.toSql())
      .join(' ' + BinaryLogicalOperator.Or.toSql() + ' ') + ' ';
}

/*
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
*/
