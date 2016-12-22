// Copyright (c) 2016, Ravi Teja Gudapati. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library query;

import 'package:meta/meta.dart';

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

abstract class ToSqlable {
  String toSql();
}

class Sql {
  static FindStatement get find => new FindStatement();

  static InsertStatement get insert => new InsertStatement();

  static UpdateStatement get update => new UpdateStatement();

  static DeleteStatement get delete => new DeleteStatement();
}
