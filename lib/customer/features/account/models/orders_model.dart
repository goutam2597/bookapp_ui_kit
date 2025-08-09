class OrdersModel {
  final String title;
  final String date;
  final String paymentStatus;
  final String orderStatus;

  OrdersModel({
    required this.title,
    required this.date,
    required this.paymentStatus,
    required this.orderStatus,
  });
}

final List<OrdersModel> orders = [
  OrdersModel(
    title: 'X-Drive Gaming Mouse',
    date: '25/06/25',
    paymentStatus: 'Completed',
    orderStatus: 'Pending',
  ),
  OrdersModel(
    title: 'Precision Craft Pencil with Holder',
    date: '26/06/25',
    paymentStatus: 'Rejected',
    orderStatus: 'Processing',
  ),
  OrdersModel(
    title: 'Beard Oil for Skin Regeneration',
    date: '27/06/25',
    paymentStatus: 'Completed',
    orderStatus: 'Processing',
  ),
  OrdersModel(
    title: 'Portable Bluetooth Speaker',
    date: '24/06/25',
    paymentStatus: 'Completed',
    orderStatus: 'Delivered',
  ),
  OrdersModel(
    title: 'Ergonomic Office Chair',
    date: '23/06/25',
    paymentStatus: 'Pending',
    orderStatus: 'Cancelled',
  ),
  OrdersModel(
    title: 'Smart LED Desk Lamp',
    date: '22/06/25',
    paymentStatus: 'Completed',
    orderStatus: 'Delivered',
  ),
  OrdersModel(
    title: 'USB-C Charging Cable',
    date: '21/06/25',
    paymentStatus: 'Completed',
    orderStatus: 'Pending',
  ),
  OrdersModel(
    title: 'Wireless Earbuds',
    date: '20/06/25',
    paymentStatus: 'Rejected',
    orderStatus: 'Cancelled',
  ),
  OrdersModel(
    title: '4K Action Camera',
    date: '19/06/25',
    paymentStatus: 'Completed',
    orderStatus: 'Delivered',
  ),
  OrdersModel(
    title: 'Digital Drawing Tablet',
    date: '18/06/25',
    paymentStatus: 'Pending',
    orderStatus: 'Processing',
  ),
];
