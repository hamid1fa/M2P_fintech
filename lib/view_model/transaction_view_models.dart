import 'dart:convert';
import 'package:flutter/material.dart';

import '../models/transactions.dart';

class TransactionViewModel with ChangeNotifier {
  List<Transaction> _transactions = [];
  final PageController _pageController = PageController();
  int _currentPage = 0;

  TransactionViewModel() {
    loadTransactions();
    _pageController.addListener(_onPageChanged);
  }

  List<Transaction> get transactions => _transactions;

  PageController get pageController => _pageController;

  int get currentPage => _currentPage;

  set currentPage(int page) {
    if (_currentPage != page) {
      _currentPage = page;
      notifyListeners();
    }
  }

  void _onPageChanged() {
    final int newPage = _pageController.page?.round() ?? 0;
    if (newPage != _currentPage) {
      currentPage = newPage;
    }
  }

  void loadTransactions() {
    const jsonData = '''
    {
      "transactions": [
        {
          "id": 1,
          "user_id": "1",
          "user_name": "Marcus Gouse",
          "user_icon": "https://res.cloudinary.com/dzklqz4hm/image/upload/v1722610904/Marcus_klt5bd.png",
          "bank_id": "1001",
          "bank_name": "Bank 1",
          "bank_bg": "https://res.cloudinary.com/dzklqz4hm/image/upload/v1721042437/Group_1321315030_gzvlbc.png",
          "status": "Completed",
          "amount": "20,000.00",
          "type": "CREDIT",
          "time": "10:51 PM"
        },
        {
          "id": 2,
          "user_id": "2",
          "user_name": "Nike",
          "user_icon": "https://res.cloudinary.com/dzklqz4hm/image/upload/v1722610905/Nike_y0niz1.png",
          "bank_id": "1002",
          "bank_name": "Bank 2",
          "bank_bg": "https://res.cloudinary.com/dzklqz4hm/image/upload/v1721042438/Group_1321315034_iml6he.png",
          "status": "Failed",
          "amount": "9.00",
          "type": "DEBIT",
          "time": "10:51 PM"
        },
        {
          "id": 3,
          "user_id": "3",
          "user_name": "Roger Carder",
          "user_icon": "https://res.cloudinary.com/dzklqz4hm/image/upload/v1722610905/Roger_wop2uz.png",
          "bank_id": "1001",
          "bank_name": "Bank 1",
          "bank_bg": "https://res.cloudinary.com/dzklqz4hm/image/upload/v1721042437/Group_1321315030_gzvlbc.png",
          "status": "Completed",
          "amount": "2,500.00",
          "type": "DEBIT",
          "time": "10:51 PM"
        },
        {
          "id": 4,
          "user_id": "3",
          "user_name": "Roger Carder",
          "user_icon": "https://res.cloudinary.com/dzklqz4hm/image/upload/v1722610905/Roger_wop2uz.png",
          "bank_id": "1001",
          "bank_name": "Bank 1",
          "bank_bg": "https://res.cloudinary.com/dzklqz4hm/image/upload/v1721042437/Group_1321315030_gzvlbc.png",
          "status": "Completed",
          "amount": "500.00",
          "type": "CREDIT",
          "time": "10:51 PM"
        },
        {
          "id": 5,
          "user_id": "4",
          "user_name": "Brandon",
          "user_icon": "https://res.cloudinary.com/dzklqz4hm/image/upload/v1722610904/Brandon_q23pim.png",
          "bank_id": "1002",
          "bank_name": "Bank 2",
          "bank_bg": "https://res.cloudinary.com/dzklqz4hm/image/upload/v1721042438/Group_1321315034_iml6he.png",
          "status": "Completed",
          "amount": "20.00",
          "type": "CREDIT",
          "time": "10:51 PM"
        }
      ],
      "respcode": "200",
      "respdesc": "Success.",
      "status": "Success"
    }
    ''';

    final data = Map<String, dynamic>.from(json.decode(jsonData));
    _transactions = List<Transaction>.from(
        data['transactions'].map((item) => Transaction.fromJson(item)));
    notifyListeners();
  }

  List<String> get userIcons {
    return transactions
        .map((transaction) => transaction.userIcon)
        .toSet()
        .toList();
  }

  List<String> get userNames {
    return transactions
        .map((transaction) => transaction.userName)
        .toSet()
        .toList();
  }

  double get totalBalance {
    double total = 0;
    for (var transaction in _transactions) {
      if (transaction.status == 'Completed') {
        double amount =
            double.tryParse(transaction.amount.replaceAll(',', '')) ?? 0;
        if (transaction.type == 'CREDIT') {
          total += amount;
        } else if (transaction.type == 'DEBIT') {
          total -= amount;
        }
      }
    }
    return total;
  }

  double get bank1Balance {
    double total = 0;
    for (var transaction in _transactions) {
      if (transaction.bankId == "1001" && transaction.status == 'Completed') {
        double amount =
            double.tryParse(transaction.amount.replaceAll(',', '')) ?? 0;
        if (transaction.type == 'CREDIT') {
          total += amount;
        } else if (transaction.type == 'DEBIT') {
          total -= amount;
        }
      }
    }
    return total;
  }

  double get bank2Balance {
    double total = 0;
    for (var transaction in _transactions) {
      if (transaction.bankId == "1002" && transaction.status == 'Completed') {
        double amount =
            double.tryParse(transaction.amount.replaceAll(',', '')) ?? 0;
        if (transaction.type == 'CREDIT') {
          total += amount;
        } else if (transaction.type == 'DEBIT') {
          total -= amount;
        }
      }
    }
    return total;
  }

  void setTransactions(List<Transaction> transactions) {
    _transactions = transactions;
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
