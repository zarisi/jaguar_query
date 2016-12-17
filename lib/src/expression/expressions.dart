part of query;

abstract class Expression implements ToSqlable {
  const Expression();

  int get length;

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

abstract class ExpressionMixin implements Expression {}

/// Condition encapsulates a conditional expression
///
/// (<field> <operation> <value>)
class C<ValType extends V> extends Expression {
  final String field;

  final ComparisonOperator op;

  final ValType value;

  const C(this.field, this.op, this.value);

  static C eq<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.Eq, value);

  static C ne<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.Ne, value);

  static C gt<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.Gt, value);

  static C gtEq<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.GtEq, value);

  static C ltEq<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.LtEq, value);

  static C lt<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.Lt, value);

  static C like(String field, VString value) =>
      new C(field, ComparisonOperator.Like, value);

  static InBetweenExpression inBetween<ValType extends V>(
          String field, ValType low, ValType high) =>
      new InBetweenExpression<ValType>(field, low, high);

  int get length => 1;

  @checked
  AndExpression and(Expression exp) {
    AndExpression ret = new AndExpression();
    return ret.and(this).and(exp);
  }

  @checked
  OrExpression or(Expression exp) {
    OrExpression ret = new OrExpression();
    return ret.or(this).or(exp);
  }

  String toSql() => '$field ${op.toSql()} ${value.toSql()}';
}

class InBetweenExpression<ValType extends V> extends Expression {
  final String field;

  final ValType low;

  final ValType high;

  const InBetweenExpression(this.field, this.low, this.high);

  int get length => 1;

  @checked
  AndExpression and(Expression exp) {
    AndExpression ret = new AndExpression();
    return ret.and(this).and(exp);
  }

  @checked
  OrExpression or(Expression exp) {
    OrExpression ret = new OrExpression();
    return ret.or(this).or(exp);
  }

  String toSql() => '($field BETWEEN ${low.toSql()} AND ${high.toSql()})';
}

class AndExpression extends Expression {
  final List<Expression> _expressions = [];

  AndExpression();

  int get length => _expressions.length;

  @checked
  AndExpression and(Expression exp) {
    if (exp is AndExpression) {
      _expressions.addAll(exp._expressions);
    } else {
      _expressions.add(exp);
    }

    return this;
  }

  @checked
  OrExpression or(Expression exp) {
    OrExpression ret = new OrExpression();

    return ret.or(this).or(exp);
  }

  String toSql() => _expressions.map((Expression exp) {
        StringBuffer sb = new StringBuffer();

        if (exp.length != 1) {
          sb.write('(');
        }

        sb.write(exp.toSql());

        if (exp.length != 1) {
          sb.write(')');
        }

        return sb.toString();
      }).join(' ' + BinaryLogicalOperator.And.toSql() + ' ');
}

class OrExpression extends Expression {
  final List<Expression> _expressions = [];

  OrExpression();

  int get length => _expressions.length;

  @checked
  AndExpression and(Expression exp) {
    AndExpression ret = new AndExpression();
    return ret.and(this).and(exp);
  }

  @checked
  OrExpression or(Expression exp) {
    if (exp is OrExpression) {
      _expressions.addAll(exp._expressions);
    } else {
      _expressions.add(exp);
    }

    return this;
  }

  String toSql() => _expressions.map((Expression exp) {
        StringBuffer sb = new StringBuffer();

        if (exp.length != 1) {
          sb.write('(');
        }

        sb.write(exp.toSql());

        if (exp.length != 1) {
          sb.write(')');
        }

        return sb.toString();
      }).join(' ' + BinaryLogicalOperator.Or.toSql() + ' ');
}
