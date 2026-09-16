import 'package:flutter/material.dart';

void main() {
  runApp(const BhimLiteApp());
}

class BhimLiteApp extends StatelessWidget {
  const BhimLiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BHIM Lite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00796B), // Clean Indian teal/green
          surface: const Color(0xFFF8F9FA),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F6F8),
      ),
      home: const BhimHomeScreen(),
    );
  }
}

class BhimHomeScreen extends StatelessWidget {
  const BhimHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF00796B),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'BHIM',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  letterSpacing: 1.1,
                ),
              ),
            ),
            const SizedBox(width: 6),
            const Text(
              'LITE',
              style: TextStyle(
                color: Color(0xFF00796B),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history_rounded, color: Colors.black87),
            tooltip: 'Passbook / History',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined, color: Colors.black87),
            tooltip: 'Profile',
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Primary Account Card
          const AccountSummaryCard(),
          const SizedBox(height: 20),

          // Core Actions Grid
          const Text(
            'Transfer Money',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          const TransferActionGrid(),
          const SizedBox(height: 24),

          // Quick Recent Payees
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Payees',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('View all'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const RecentPayeesList(),
        ],
      ),
      // Big primary Scan QR action for quick physical store checkout
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFF00796B),
        icon: const Icon(Icons.qr_code_scanner_rounded, color: Colors.white),
        label: const Text(
          'Scan QR',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class AccountSummaryCard extends StatelessWidget {
  const AccountSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.account_balance_rounded, color: Color(0xFF00796B), size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'State Bank of India (••4092)',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.verified, color: Colors.blue, size: 16),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Primary UPI ID',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'username@upi',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  side: const BorderSide(color: Color(0xFF00796B)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'Check Balance',
                  style: TextStyle(
                    color: Color(0xFF00796B),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransferActionGrid extends StatelessWidget {
  const TransferActionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      {'icon': Icons.alternate_email_rounded, 'label': 'To UPI ID'},
      {'icon': Icons.contact_phone_outlined, 'label': 'To Mobile'},
      {'icon': Icons.account_balance_outlined, 'label': 'Bank Transfer'},
      {'icon': Icons.arrow_downward_rounded, 'label': 'Request'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: actions.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.82,
      ),
      itemBuilder: (context, index) {
        final item = actions[index];
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Icon(
                  item['icon'] as IconData,
                  color: const Color(0xFF00796B),
                  size: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item['label'] as String,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class RecentPayeesList extends StatelessWidget {
  const RecentPayeesList({super.key});

  final List<Map<String, String>> recents = const [
    {'name': 'Ramesh Kirana', 'vpa': 'ramesh@upi', 'initial': 'R'},
    {'name': 'Pooja Sharma', 'vpa': 'pooja@oksbi', 'initial': 'P'},
    {'name': 'Milk Depot', 'vpa': 'dairy@paytm', 'initial': 'M'},
    {'name': 'Aman Verma', 'vpa': 'aman@axl', 'initial': 'A'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: recents.length,
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.grey.shade100),
        itemBuilder: (context, index) {
          final payee = recents[index];
          return ListTile(
            dense: true,
            leading: CircleAvatar(
              backgroundColor: const Color(0xFFE0F2F1),
              foregroundColor: const Color(0xFF00796B),
              child: Text(
                payee['initial']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              payee['name']!,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5),
            ),
            subtitle: Text(
              payee['vpa']!,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
            onTap: () {},
          );
        },
      ),
    );
  }
}
