import 'package:flutter/material.dart';

import '../widgets/topbar.dart';

/// Amount entry page
class AmountEntryPage extends StatelessWidget {
  /// Amount entry page constructor
  const AmountEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(99),
        child: TopBar(
          label: 'ATM',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}