import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _resiteredExpenses = [
    Expense(
      title: 'Fired Chicken',
      amount: 200,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Cinema',
      amount: 400,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpenses),
    );
  }

  void _addExpenses(Expense expense) {
    setState(() {
      _resiteredExpenses.add(expense);
    });
  }

  void _removeExpenses(Expense expense) {
    final expenseIndex = _resiteredExpenses.indexOf(expense);
    setState(() {
      _resiteredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted!'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _resiteredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No Expenses Found. Start Adding Some!'),
    );
    if (_resiteredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expense: _resiteredExpenses,
        onRemoveExpense: _removeExpenses,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _resiteredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
