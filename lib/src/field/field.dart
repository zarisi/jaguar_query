library jaguar_orm.field;

import 'package:jaguar_query/jaguar_query.dart';

/// Field is a convenience DSL used to construct queries in a concise and
/// understandable way.
class Field<ValType extends V> {
  /// Name of the field
  final String name;

  const Field(this.name);

  /// Returns an "is equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> author = new Field<VInt>('age');
  ///     find.where(age.eq(20));
  C<ValType> eq(ValType value) => C.eq<ValType>(name, value);

  /// Returns a "not equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.ne(20));
  C<ValType> ne(ValType value) => C.ne<ValType>(name, value);

  /// Returns a "greater than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.gt(20));
  C<ValType> gt(ValType value) => C.gt<ValType>(name, value);

  /// Returns a "greater than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.gtEq(20));
  C<ValType> gtEq(ValType value) => C.gtEq<ValType>(name, value);

  /// Returns a "less than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.ltEq(20));
  C<ValType> ltEq(ValType value) => C.ltEq<ValType>(name, value);

  /// Returns a "less than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.lt(20));
  C<ValType> lt(ValType value) => C.lt<ValType>(name, value);

  /// Returns a "like" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<String> author = new Field<String>('author');
  ///     find.where(author.like('%Mark%'));
  C<ValType> like(VString value) => C.like(name, value);

  /// Returns an "in between" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.inBetween(20, 30));
  InBetweenExpression inBetween(ValType low, ValType high) =>
      C.inBetween<ValType>(name, low, high);

  /// Returns a "set column" clause
  ///
  ///     UpdateStatement update = new UpdateStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     update.set(age.set(20));
  SetColumn set(ValType value) =>
      new SetColumn<ValType>().column(name).set(value);
}

/// IntField is a convenience DSL used to construct queries in a concise and
/// understandable way.
class IntField {
  /// Name of the field
  final String name;

  const IntField(this.name);

  /// Returns an "is equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.eq(20));
  C<VInt> eq(int value) => C.eq<VInt>(name, V.Int(value));

  /// Returns a "not equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.ne(20));
  C<VInt> ne(int value) => C.ne<VInt>(name, V.Int(value));

  /// Returns a "greater than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.gt(20));
  C<VInt> gt(int value) => C.gt<VInt>(name, V.Int(value));

  /// Returns a "greater than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.gtEq(20));
  C<VInt> gtEq(int value) => C.gtEq<VInt>(name, V.Int(value));

  /// Returns a "less than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.ltEq(20));
  C<VInt> ltEq(int value) => C.ltEq<VInt>(name, V.Int(value));

  /// Returns a "less than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.lt(20));
  C<VInt> lt(int value) => C.lt<VInt>(name, V.Int(value));

  /// Returns an "in between" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.inBetween(20, 30));
  InBetweenExpression<VInt> inBetween(int low, int high) =>
      C.inBetween<VInt>(name, V.Int(low), V.Int(high));

  /// Returns a "set column" clause
  ///
  ///     UpdateStatement update = new UpdateStatement();
  ///     IntField age = new IntField('age');
  ///     update.set(age.set(20));
  SetColumn<VInt> set(int value) =>
      new SetColumn<VInt>().column(name).set(V.Int(value));
}


/// DoubleField is a convenience DSL used to construct queries in a concise and
/// understandable way.
class DoubleField {
  /// Name of the field
  final String name;

  const DoubleField(this.name);

  /// Returns an "is equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.eq(20));
  C<VDouble> eq(double value) => C.eq<VDouble>(name, V.Double(value));

  /// Returns a "not equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.ne(20));
  C<VDouble> ne(double value) => C.ne<VDouble>(name, V.Double(value));

  /// Returns a "greater than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.gt(20));
  C<VDouble> gt(double value) => C.gt<VDouble>(name, V.Double(value));

  /// Returns a "greater than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.gtEq(20));
  C<VDouble> gtEq(double value) => C.gtEq<VDouble>(name, V.Double(value));

  /// Returns a "less than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.ltEq(20));
  C<VDouble> ltEq(double value) => C.ltEq<VDouble>(name, V.Double(value));

  /// Returns a "less than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.lt(20));
  C<VDouble> lt(double value) => C.lt<VDouble>(name, V.Double(value));

  /// Returns an "in between" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.inBetween(20, 30));
  InBetweenExpression<VDouble> inBetween(double low, double high) =>
      C.inBetween<VDouble>(name, V.Double(low), V.Double(high));

  /// Returns a "set column" clause
  ///
  ///     UpdateStatement update = new UpdateStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     update.set(age.set(20));
  SetColumn<VDouble> set(double value) =>
      new SetColumn<VDouble>().column(name).set(V.Double(value));
}

/// StrField is a convenience DSL used to construct queries in a concise and
/// understandable way.
class StrField {
  /// Name of the field
  final String name;

  const StrField(this.name);

  /// Returns an "is equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.eq('Mark'));
  C<VString> eq(String value) => C.eq<VString>(name, V.Str(value));

  /// Returns a "not equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.ne('Mark'));
  C<VString> ne(String value) => C.ne<VString>(name, V.Str(value));

  /// Returns a "greater than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.gt('Mark'));
  C<VString> gt(String value) => C.gt<VString>(name, V.Str(value));

  /// Returns a "greater than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.gtEq('Mark'));
  C<VString> gtEq(String value) => C.gtEq<VString>(name, V.Str(value));

  /// Returns a "less than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.ltEq('Mark'));
  C<VString> ltEq(String value) => C.ltEq<VString>(name, V.Str(value));

  /// Returns a "less than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.lt('Mark'));
  C<VString> lt(String value) => C.lt<VString>(name, V.Str(value));

  /// Returns a "like" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.like('%Mark%'));
  C<VString> like(String value) => C.like(name, V.Str(value));

  /// Returns an "in between" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.inBetween('C', 'M'));
  InBetweenExpression<VString> inBetween(String low, String high) =>
      C.inBetween<VString>(name, V.Str(low), V.Str(high));

  /// Returns a "set column" clause
  ///
  ///     UpdateStatement update = new UpdateStatement();
  ///     StrField author = new StrField('author');
  ///     update.set(author.set('Mark'));
  SetColumn<VString> set(String value) =>
      new SetColumn<VString>().column(name).set(V.Str(value));
}
