import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends StatefulWidget {
  final Map<String, dynamic>? bookingDetails;

  const PaymentScreen({Key? key, this.bookingDetails}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Booking Summary
            _buildBookingSummary(context),

            SizedBox(height: 24),

            // Payment Details Form
            Text(
              'Payment Details',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),

            // Card Number
            TextField(
              controller: _cardNumberController,
              decoration: InputDecoration(
                labelText: 'Card Number',
                prefixIcon: Icon(Icons.credit_card),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            // Name on Card
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name on Card',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Expiry and CVV Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _expiryController,
                    decoration: InputDecoration(
                      labelText: 'Expiry (MM/YY)',
                      prefixIcon: Icon(Icons.calendar_month),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _cvvController,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: _processPayment,
            child: Text('Pay Now'),
          ),
        ),
      ),
    );
  }

  Widget _buildBookingSummary(BuildContext context) {
    final bookingDetails = widget.bookingDetails;

    if (bookingDetails == null) {
      return Text('No booking details available');
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Summary',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            _buildSummaryRow('Date',
                DateFormat('dd MMM yyyy').format(bookingDetails['date'])),
            _buildSummaryRow('Court', bookingDetails['court']),
            _buildSummaryRow('Slots', _formatSlots(bookingDetails['slots'])),
            Divider(height: 24),
            _buildSummaryRow('Total Price',
                '\$${bookingDetails['totalPrice'].toStringAsFixed(2)}',
                bold: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  String _formatSlots(List slots) {
    return slots.map((slot) => slot['time']).join(', ');
  }

  void _processPayment() {
    // Validate input fields
    if (_validatePaymentDetails()) {
      // Show payment confirmation dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Payment Successful'),
          content: Text('Your playground booking is confirmed!'),
          actions: [
            TextButton(
              onPressed: () {
                // Navigate back to home screen
                context.go('/');
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  bool _validatePaymentDetails() {
    // Implement validation logic for card details
    if (_cardNumberController.text.isEmpty ||
        _nameController.text.isEmpty ||
        _expiryController.text.isEmpty ||
        _cvvController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all payment details')),
      );
      return false;
    }
    return true;
  }
}
