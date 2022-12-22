import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apptheme = ChangeNotifierProvider.autoDispose<AppTheme>(
  (ref) => AppTheme(),
);

class AppTheme extends ChangeNotifier {
  Color primaryColor = const Color(0xff57ebd6);
  Color backgroundColor = const Color(0xff251a30);
}
