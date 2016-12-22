part of query;

class AndExpression extends Expression {
  final List<Expression> _expressions = [];

  AndExpression();

  List<Expression> get expressions => _expressions.toList();

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