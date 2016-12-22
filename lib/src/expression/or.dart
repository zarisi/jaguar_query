part of query;

class OrExpression extends Expression {
  final List<Expression> _expressions = [];

  OrExpression();

  List<Expression> get expressions => _expressions.toList();

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