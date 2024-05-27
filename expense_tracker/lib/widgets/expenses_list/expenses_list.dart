import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';


class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expense});

  final List<Expense> expense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:expense.length,
      itemBuilder: (ctx, index) => ExpenseItem(expense: expense[index]),
      );
  }
}