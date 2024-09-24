import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum TransactionCategory { investment, food, vehicle, other }

enum TransactionType { manual, automatic }

enum TransactionStatus { income, expense }

class TransactionModel {
  String uid;
  String name;
  String note;

  TransactionCategory category;
  TransactionType type;
  TransactionStatus status;

  DateTime dateTime;
  double amount;

  TransactionModel({
    required this.name,
    required this.amount,
    required this.status,
    required this.category,
    required this.type,
    required this.dateTime,
    required this.note,
  }) : uid = const Uuid().v4();

  String returnDate() {
    return DateFormat('dd MMMM yyyy').format(dateTime);
  }

  String returnTime() {
    return DateFormat('hh:mm a').format(dateTime);
  }
}
