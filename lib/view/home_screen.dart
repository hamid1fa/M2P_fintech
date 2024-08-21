import 'package:drag_and_drop_game/view/widgets/balance_summary.dart';
import 'package:drag_and_drop_game/view/widgets/user_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/transaction_view_models.dart';
import 'widgets/transaction_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionVM = Provider.of<TransactionViewModel>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BalanceSummary(),
              UserIcons(),
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    250, // Adjust the height
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color of the container
                    borderRadius: const BorderRadius.only(
                      topLeft:
                          Radius.circular(40.0), // Curve for top left corner
                      topRight:
                          Radius.circular(40.0), // Curve for top right corner
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Shadow color
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // Shadow offset
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: transactionVM.transactions.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return TransactionItem(
                          transaction: transactionVM.transactions[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
