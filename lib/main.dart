import 'package:drag_and_drop_game/view/home_screen.dart';
import 'package:drag_and_drop_game/view/main_screen.dart';
import 'package:drag_and_drop_game/view_model/transaction_view_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionViewModel()),
      ],
      child: MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
