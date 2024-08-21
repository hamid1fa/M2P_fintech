import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/transaction_view_models.dart';

class BalanceSummary extends StatelessWidget {
  const BalanceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the container
              borderRadius:
                  BorderRadius.circular(40.0), // Radius for rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset:
                      const Offset(0, 3), // Changes the position of the shadow
                ),
              ],
            ),
            margin: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 8.0), // Margin around the container
            padding: const EdgeInsets.all(8.0), // Padding inside the container
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 20.0, // Background color of the circle
                child: Icon(
                  Icons.ac_unit, // Trophy icon
                  color: Colors.white, // Icon color
                ),
              ),
              title: const Text(
                "Total Balance",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                "\$ ${transactionProvider.totalBalance.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 26.0), // Adjust the value to move text left
              child: Text(
                'Accounts',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 150, // Adjust height if needed
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child: Stack(
              children: [
                PageView(
                  controller: transactionProvider.pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int page) {
                    transactionProvider.currentPage = page;
                  },
                  children: [
                    // Bank 1 Card
                    Container(
                      width: MediaQuery.of(context).size.width *
                          0.8, // Increased width
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Bank 1",
                              style: TextStyle(color: Colors.white)),
                          const Text("Bank Id - 1001",
                              style: TextStyle(color: Colors.white)),
                          const Spacer(),
                          Text(
                            "\$ ${transactionProvider.bank1Balance.toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    // Bank 2 Card
                    Container(
                      width: MediaQuery.of(context).size.width *
                          0.6, // Increased width
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Bank 2",
                              style: TextStyle(color: Colors.white)),
                          const Text("Bank Id - 1002",
                              style: TextStyle(color: Colors.white)),
                          const Spacer(),
                          Text(
                            "\$ ${transactionProvider.bank2Balance.toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  2, // Number of pages/cards
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: transactionProvider.currentPage == index
                        ? 28.0
                        : 8.0, // Increased width for the current page
                    height: transactionProvider.currentPage == index
                        ? 8.0
                        : 8.0, // Increased height for the current page
                    decoration: BoxDecoration(
                      color: transactionProvider.currentPage == index
                          ? Colors.blueAccent
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
