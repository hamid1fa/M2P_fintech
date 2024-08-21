import 'package:flutter/material.dart';

import '../../models/transactions.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(transaction.userIcon),
            ),
            title: Text(transaction.userName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.time),
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  transaction.type == 'CREDIT'
                      ? '+${transaction.amount} USD'
                      : '-${transaction.amount} USD',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(transaction.bankName),
              ],
            ),
          ),
          Row(
            children: [
              transaction.status == "Completed"
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : const CircleAvatar(
                      radius: 12, // Adjust the size as needed
                      backgroundColor:
                          Colors.redAccent, // Background color of the circle
                      child: Icon(
                        Icons.close,
                        color: Colors.white, // Icon color
                        size: 16, // Icon size
                      ),
                    ),
              const SizedBox(width: 4),
              Text(transaction.status == 'Completed' ? 'Completed' : 'Failed')
            ],
          ),
        ],
      ),
    );
  }
}
