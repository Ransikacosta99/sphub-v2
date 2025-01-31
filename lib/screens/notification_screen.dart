import 'package:flutter/material.dart';

// Notification data model
class Notification {
  final String title;
  final String message;
  final DateTime timestamp;
  bool isRead;

  Notification(
      {required this.title,
      required this.message,
      required this.timestamp,
      this.isRead = false});
}

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Sample notifications list
  List<Notification> notifications = [
    Notification(
        title: "New Order",
        message: "Your order #1234 has been processed",
        timestamp: DateTime.now().subtract(Duration(hours: 2)),
        isRead: false),
    Notification(
        title: "Delivery Update",
        message: "Your package is out for delivery",
        timestamp: DateTime.now().subtract(Duration(days: 1)),
        isRead: true),
    Notification(
        title: "Promotion",
        message: "Check out our latest summer sale!",
        timestamp: DateTime.now().subtract(Duration(days: 3)),
        isRead: true),
  ];

  // Method to mark notification as read
  void _markNotificationAsRead(int index) {
    setState(() {
      notifications[index].isRead = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use theme colors
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications', style: theme.textTheme.titleLarge),
        actions: [
          IconButton(
            icon: Icon(Icons.done_all, color: theme.colorScheme.primary),
            onPressed: () {
              setState(() {
                for (var notification in notifications) {
                  notification.isRead = true;
                }
              });
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Container(
            color: notification.isRead
                ? theme.colorScheme.primaryContainer.withOpacity(0.3)
                : theme.colorScheme.surface,
            child: ListTile(
              title: Text(
                notification.title,
                style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: notification.isRead
                        ? FontWeight.normal
                        : FontWeight.bold,
                    color: notification.isRead
                        ? theme.colorScheme.onSurface.withOpacity(0.7)
                        : theme.colorScheme.onSurface),
              ),
              subtitle: Text(
                notification.message,
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: notification.isRead
                        ? theme.colorScheme.onSurface.withOpacity(0.6)
                        : theme.colorScheme.onSurface),
              ),
              trailing: Text(
                _formatTimestamp(notification.timestamp),
                style: theme.textTheme.bodySmall?.copyWith(
                    color: notification.isRead
                        ? theme.colorScheme.onSurface.withOpacity(0.5)
                        : theme.colorScheme.onSurface),
              ),
              onTap: () => _markNotificationAsRead(index),
            ),
          );
        },
      ),
    );
  }

  // Helper method to format timestamp
  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }
}
