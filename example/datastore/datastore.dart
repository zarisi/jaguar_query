import 'package:query/query.dart';

class User {
  String id;

  String name;

  String email;
}

class Select {
  const Select();
}

class From {
  final String tableName;

  final String alias;

  const From(this.tableName, [this.alias]);
}

class Filter {
  final Symbol where;

  const Filter(this.where);
}

class OrderBy {
  const OrderBy();
}

class Exp {
  const Exp();

  Exp operator+(Exp exp) {
    return this;
  }
}

abstract class Example {
  @Select()
  @From('people')
  @Filter(#where)
  @OrderBy()
  User getById(String id);

  W get where {
    final exp1 = new BExp(
        new SExp(new Q('age', ComparisonOperator.GtEq, new VInt(20))),
        BinaryLogicalOperator.And,
        new SExp(new Q('age', ComparisonOperator.LtEq, new VInt(50))));
    final exp2 = new BExp(
        new SExp(new Q('experience', ComparisonOperator.GtEq, new VInt(5))),
        BinaryLogicalOperator.And,
        new SExp(new Q('experience', ComparisonOperator.GtEq, new VInt(50))));
    final exp = new BExp(exp1, BinaryLogicalOperator.And, exp2);

    return new W()..e = exp;
  }
}