import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appauthState =
    ChangeNotifierProvider.autoDispose<AppAuthState>((ref) => AppAuthState());

class AppAuthState extends ChangeNotifier {}
