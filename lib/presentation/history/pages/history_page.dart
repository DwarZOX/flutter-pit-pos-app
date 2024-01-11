import 'package:pit_pos_app/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

import '../../../core/components/spaces.dart';
import '../../../core/components/tab_custom.dart';
import '../../../core/constants/colors.dart';
import '../models/history_model.dart';
import '../models/history_transaction_model.dart';
import '../widgets/history_card.dart';
import '../widgets/history_transaction_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    const paddingHorizontal = EdgeInsets.symmetric(horizontal: 16.0);
    final indeValue = ValueNotifier(0);

    final List<HistoryTransactionModel> historyTransactions = [
      HistoryTransactionModel(
        name: 'Payment 1',
        category: 'Category A',
        price: 50000,
      ),
      HistoryTransactionModel(
        name: 'Payment 2',
        category: 'Category B',
        price: 75000,
      ),
      HistoryTransactionModel(
        name: 'Payment 3',
        category: 'Category C',
        price: 100000,
      ),
    ];
    final List<HistoryModel> histories = [
      HistoryModel(
        paymentMethod: 'Credit Card',
        totalBill: 150000,
        nominalPayment: 150000,
        paymentTime: DateTime.now().subtract(const Duration(days: 2)),
        status: 'Success',
      ),
      HistoryModel(
        paymentMethod: 'Bank Transfer',
        totalBill: 120000,
        nominalPayment: 120000,
        paymentTime: DateTime.now().subtract(const Duration(days: 1)),
        status: 'Pending',
      ),
      HistoryModel(
        paymentMethod: 'E-wallet',
        totalBill: 200000,
        nominalPayment: 200000,
        paymentTime: DateTime.now(),
        status: 'Success',
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('History Orders',
              style: TextStyle(fontWeight: FontWeight.bold)),
          // backgroundColor: AppColors.primary,
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          itemCount: historyTransactions.length,
          separatorBuilder: (context, index) => const SpaceHeight(8.0),
          itemBuilder: (context, index) => HistoryTransactionCard(
            padding: paddingHorizontal,
            data: historyTransactions[index],
          ),
        ));
  }
}
