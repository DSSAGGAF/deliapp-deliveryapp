class Notification1 {
  List<Notification1> notifications;
  int notificationId;
  int userId;
  int orderId;
  String notificationContent;
  bool status;
  bool driverMode;

  Notification1(
      {this.notificationId,
      this.userId,
      this.orderId,
      this.notificationContent,
      this.status,
      this.driverMode});

  factory Notification1.fromJson(Map<String, dynamic> parsedJson) =>
      Notification1(
        notificationId: parsedJson['notification_id'],
        userId: parsedJson['user_id'],
        orderId: parsedJson['order_id'],
        notificationContent: parsedJson['notification_content'],
        status: parsedJson['status'],
        driverMode: parsedJson['driver_mode']
      );
}
