class Order {
  List<Order> orders;
  int orderId;
  int userId;
  String requsetTitle;
  String requsetDesc;
  String requsetFrom;
  String requsetTo;
  int price;

  Order(this.orderId, this.userId, this.requsetTitle, this.requsetDesc,
      this.requsetFrom, this.requsetTo, this.price);

  factory Order.fromJson(Map<String, dynamic> parsedJson) {
    return Order(
      parsedJson['order_id'],
      parsedJson['user_id'],
      parsedJson['request_title'],
      parsedJson['request_desc'],
      parsedJson['request_from'],
      parsedJson['request_to'],
      parsedJson['price'],
    );
  }
  
}

