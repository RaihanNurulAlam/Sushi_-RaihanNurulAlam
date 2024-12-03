import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final String totalPayment;

  const PaymentScreen({
    super.key,
    required this.totalPayment,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Screen'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Total Payment',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'IDR ',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: widget.totalPayment.toString(),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
