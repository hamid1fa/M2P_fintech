import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/transaction_view_models.dart';

class UserIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionVM = Provider.of<TransactionViewModel>(context);

    return Container(
      height: 150, // Adjust height to fit both icon and text
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: List.generate(
              transactionVM.userIcons.length, // Number of user icons
              (index) => Container(
                width: 80, // Width for each icon and text container
                margin: const EdgeInsets.only(right: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 36.0, // Adjust size as needed
                      backgroundImage: NetworkImage(transactionVM
                          .userIcons[index]), // Assuming user icons are URLs
                    ),
                    const SizedBox(height: 8.0), // Space between icon and text
                    Text(
                      transactionVM
                          .userNames[index], // Display corresponding user name
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
