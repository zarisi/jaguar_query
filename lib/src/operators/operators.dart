library jaguary_query.operators;

import 'package:jaguar_query/src/core/core.dart';

part 'int.dart';

/// DSL to create 'is equal to' relational condition
Cond<ValType> eq<ValType>(String field, Valuable<ValType> rhs) =>
    new Cond<ValType>(C<ValType>(field), ComparisonOperator.Eq, rhs);

/// DSL to create 'is not equal to' relational condition
Cond<ValType> ne<ValType>(String field, Valuable<ValType> value) =>
    new Cond<ValType>(C<ValType>(field), ComparisonOperator.Ne, value);

/// DSL to create 'is greater than' relational condition
Cond<ValType> gt<ValType>(String field, Valuable<ValType> value) =>
    new Cond<ValType>(C<ValType>(field), ComparisonOperator.Gt, value);

/// DSL to create 'is greater than or equal to' relational condition
Cond<ValType> gtEq<ValType>(String field, Valuable<ValType> value) =>
    new Cond<ValType>(C<ValType>(field), ComparisonOperator.GtEq, value);

/// DSL to create 'is less than or equal to' relational condition
Cond<ValType> ltEq<ValType>(String field, Valuable<ValType> value) =>
    new Cond<ValType>(C<ValType>(field), ComparisonOperator.LtEq, value);

/// DSL to create 'is less than' relational condition
Cond<ValType> lt<ValType>(String field, Valuable<ValType> value) =>
    new Cond<ValType>(C<ValType>(field), ComparisonOperator.Lt, value);

/// DSL to create 'is like' relational condition
Cond<LStr> like(String field, LStr value) =>
    new Cond<LStr>(C<String>(field), ComparisonOperator.Like, value);

/// DSL to create 'in-between' relational condition
InBetweenExpression<ValType> inBetween<ValType>(
        String field, Valuable<ValType> low, Valuable<ValType> high) =>
    new InBetweenExpression<ValType>(C<ValType>(field), low, high);

/// DSL to create 'is equal to column' relational condition
Cond<ValType> eqC<ValType>(String field, Column<ValType> value) =>
    new Cond<ValType>(C<ValType>(field), ComparisonOperator.Eq, value);
