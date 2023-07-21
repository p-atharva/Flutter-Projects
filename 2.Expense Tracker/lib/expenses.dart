// ignore_for_file: sized_box_for_whitespace

import 'package:expense_tracker/widgets/charts/chart.dart';

import 'package:expense_tracker/widgets/expenses_list/newexpense.dart';
import 'package:flutter/material.dart';

import 'model/expense.dart';
import 'widgets/expenses_list/expenses_list.dart';

import 'package:dotted_line/dotted_line.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _dummydata = [
    Expense(
      title: 'Groceries',
      amount: 100.00,
      date: DateTime.now(),
      category: ExpenseCategory.food,
    ),
    Expense(
      title: 'Transport',
      amount: 50.99,
      date: DateTime.now(),
      category: ExpenseCategory.transport,
    ),
    Expense(
      title: 'Internet',
      amount: 100.00,
      date: DateTime.now(),
      category: ExpenseCategory.bills,
    ),
    Expense(
      title: 'Netflix',
      amount: 100.00,
      date: DateTime.now(),
      category: ExpenseCategory.entertainment,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Container(
          height: MediaQuery.of(context).size.height * 0.75,
          child: NewExpense(onAddExpense: _addExpense)),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _dummydata.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _dummydata.indexOf(expense);
    setState(() {
      _dummydata.remove(expense);
    });
    // Undo functionality and warning to user to undo if needed!!
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text('${expense.title} removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _dummydata.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text(
        'No Expenses Here, Start Adding Some! By Spending Money!',
        softWrap: true,
      ),
    );

    if (_dummydata.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _dummydata,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddExpenseOverlay,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,

        //hoverColor: Colors.tealAccent,
        child: const Icon(Icons.add),
      ),
      body: width < 600
          ? SafeArea(
              top: true,
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  Chart(expenses: _dummydata),
                  const DottedLine(
                    dashColor: Colors.brown,
                    lineThickness: 4,
                    dashGapLength: 6,
                    dashRadius: 6,
                    dashLength: 4,
                    direction: Axis.horizontal,
                  ),
                  // Divider(
                  //   color: Theme.of(context).colorScheme.secondary,
                  //   thickness: 1.2,
                  //   indent: 12,
                  //   endIndent: 12,
                  // ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: mainContent,
                  )
                ],
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _dummydata),
                ),
                const DottedLine(
                  dashColor: Colors.brown,
                  lineThickness: 4,
                  dashGapLength: 6,
                  dashRadius: 6,
                  dashLength: 4,
                  direction: Axis.vertical,
                ),
                const SizedBox(height: 6),
                Expanded(
                  child: mainContent,
                )
              ],
            ),
    );
  }
}
