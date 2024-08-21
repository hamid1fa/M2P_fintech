class Transaction {
  final int id;
  final String userId;
  final String userName;
  final String userIcon;
  final String bankId;
  final String bankName;
  final String bankBg;
  final String status;
  final String amount;
  final String type;
  final String time;

  Transaction({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userIcon,
    required this.bankId,
    required this.bankName,
    required this.bankBg,
    required this.status,
    required this.amount,
    required this.type,
    required this.time,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      userId: json['user_id'],
      userName: json['user_name'],
      userIcon: json['user_icon'],
      bankId: json['bank_id'],
      bankName: json['bank_name'],
      bankBg: json['bank_bg'],
      status: json['status'],
      amount: json['amount'],
      type: json['type'],
      time: json['time'],
    );
  }
}
