import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  final String playgroundId;

  const BookingScreen({Key? key, required this.playgroundId}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? _selectedDate;
  String? _selectedCourt;
  List<Map<String, dynamic>> _timeSlots = [
    {'time': '08:00 - 09:00', 'price': 20, 'status': 'available'},
    {'time': '09:00 - 10:00', 'price': 25, 'status': 'booked'},
    {'time': '10:00 - 11:00', 'price': 20, 'status': 'available'},
    {'time': '11:00 - 12:00', 'price': 30, 'status': 'unavailable'},
    {'time': '12:00 - 13:00', 'price': 20, 'status': 'available'},
    {'time': '13:00 - 14:00', 'price': 25, 'status': 'available'},
  ];

  List<String> _courts = ['Court 1', 'Court 2', 'Court 3'];
  List<int> _selectedSlots = [];

  double get _totalPrice {
    return _selectedSlots.fold(
        0, (total, index) => total + _timeSlots[index]['price']);
  }

  void _showDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Playground'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Selection
            Text(
              'Select Date',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: _showDatePicker,
                child: Text(
                  _selectedDate == null
                      ? 'Choose Date'
                      : DateFormat('dd MMM yyyy').format(_selectedDate!),
                ),
              ),
            ),

            SizedBox(height: 16),

            // Court Selection
            Text(
              'Select Court',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              ),
              hint: Text('Select Court'),
              value: _selectedCourt,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCourt = newValue;
                });
              },
              items: _courts.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            SizedBox(height: 16),

            // Time Slots
            if (_selectedDate != null && _selectedCourt != null) ...[
              Text(
                'Available Time Slots',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: _timeSlots.length,
                  itemBuilder: (context, index) {
                    final slot = _timeSlots[index];
                    final isSelected = _selectedSlots.contains(index);

                    Color getColor() {
                      if (slot['status'] == 'unavailable')
                        return Colors.grey.shade300;
                      if (slot['status'] == 'booked')
                        return Colors.red.shade100;
                      return isSelected
                          ? Theme.of(context).primaryColor.withOpacity(0.2)
                          : Theme.of(context).colorScheme.surface;
                    }

                    return GestureDetector(
                      onTap: () {
                        if (slot['status'] == 'available') {
                          setState(() {
                            if (isSelected) {
                              _selectedSlots.remove(index);
                            } else {
                              _selectedSlots.add(index);
                            }
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: getColor(),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: slot['status'] == 'available'
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              slot['time'],
                              style: TextStyle(
                                color: slot['status'] == 'unavailable'
                                    ? Colors.white54
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$${slot['price']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: slot['status'] == 'unavailable'
                                    ? Colors.white54
                                    : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ] else if (_selectedDate == null) ...[
              Expanded(
                child: Center(
                  child: Text(
                    'Please select a date first',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ] else if (_selectedCourt == null) ...[
              Expanded(
                child: Center(
                  child: Text(
                    'Please select a court',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: _selectedSlots.isNotEmpty
          ? BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: \$${_totalPrice.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      onPressed: () => context.push('/payment', extra: {
                        'date': _selectedDate,
                        'court': _selectedCourt,
                        'slots': _selectedSlots
                            .map((index) => _timeSlots[index])
                            .toList(),
                        'totalPrice': _totalPrice,
                      }),
                      child: Text('Proceed to Payment'),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
