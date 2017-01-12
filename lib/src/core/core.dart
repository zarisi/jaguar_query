// Copyright (c) 2016, Ravi Teja Gudapati. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library query;

import 'dart:core';
import 'dart:core' as core show DateTime;
import 'package:meta/meta.dart';

import 'package:jaguar_query/src/operators/operators.dart' as q;

part 'expression/and.dart';
part 'expression/condition.dart';
part 'expression/expressions.dart';
part 'expression/in_between.dart';
part 'expression/or.dart';

part 'operators/comparision.dart';
part 'operators/logical.dart';

part 'statement/statements.dart';
part 'statement/find_statement.dart';
part 'statement/insert_statement.dart';
part 'statement/update_statement.dart';
part 'statement/delete_statement.dart';
part 'statement/create_table_statement.dart';

part 'table/table.dart';

part 'values/values.dart';

/// A SQL DSL object
abstract class ToSqlable {
  String toSql();
}

/// Main DSL class to create SQL statements
class Sql {
  /// Creates a new Find statement
  static FindStatement get find => new FindStatement();

  /// Creates a new insert statement
  static InsertStatement get insert => new InsertStatement();

  /// Creates a new update statement
  static UpdateStatement get update => new UpdateStatement();

  /// Creates a new delete statement
  static DeleteStatement get delete => new DeleteStatement();
}
