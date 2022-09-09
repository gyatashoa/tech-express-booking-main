enum BusType {
  VVIP(45, 'assets/images/b4.png', 'assets/images/bus2.png', crossAxisCount: 4),
  STC(20, 'assets/images/b1.png', 'assets/images/B3.png', crossAxisCount: 3),
  FORD(30, 'assets/images/b5.png', 'assets/images/bus1.png', crossAxisCount: 4),
  VIP(40, 'assets/images/b6.png', 'assets/images/bus4.png', crossAxisCount: 3),
  ;

  const BusType(this.maxCapacity, this.icon, this.busImage,
      {this.crossAxisCount = 3});
  final int maxCapacity;
  final String icon;
  final String busImage;
  final int crossAxisCount;
}
