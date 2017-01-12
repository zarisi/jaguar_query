library jaguary_query.operators;

import 'package:jaguar_query/src/core/core.dart';

/// DSL to create 'is equal to' relational condition
Cond<ValType> eq<ValType>(Valuable<ValType> lhs, Valuable<ValType> rhs) =>
    new Cond<ValType>(lhs, ComparisonOperator.Eq, rhs);

/* TODO
/// DSL to create 'is not equal to' relational condition
Cond<ValType> ne<ValType extends L>(String field, ValType value) =>
    new Cond<ValType>(field, ComparisonOperator.Ne, value);

/// DSL to create 'is greater than' relational condition
Cond<ValType> gt<ValType extends L>(String field, ValType value) =>
    new Cond<ValType>(field, ComparisonOperator.Gt, value);

/// DSL to create 'is greater than or equal to' relational condition
Cond<ValType> gtEq<ValType extends L>(String field, ValType value) =>
    new Cond<ValType>(field, ComparisonOperator.GtEq, value);

/// DSL to create 'is less than or equal to' relational condition
Cond<ValType> ltEq<ValType extends L>(String field, ValType value) =>
    new Cond<ValType>(field, ComparisonOperator.LtEq, value);

/// DSL to create 'is less than' relational condition
Cond<ValType> lt<ValType extends L>(String field, ValType value) =>
    new Cond<ValType>(field, ComparisonOperator.Lt, value);

/// DSL to create 'is like' relational condition
Cond<LStr> like(String field, LStr value) =>
    new Cond<LStr>(field, ComparisonOperator.Like, value);

/// DSL to create 'in-between' relational condition
InBetweenExpression<ValType> inBetween<ValType extends L>(
        String field, ValType low, ValType high) =>
    new InBetweenExpression<ValType>(field, low, high);

/// DSL to create 'is equal to' relational condition
Cond<ValType> eqCol<ValType extends L>(
        Column<ValType> field, Column<ValType> value) =>
    new Cond<ValType>(field, ComparisonOperator.Eq, value);
*/