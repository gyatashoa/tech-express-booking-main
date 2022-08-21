enum BusType {
  VVIP(45),
  STC(20),
  FORD(30),
  VIP(40);

  const BusType(this.maxCapacity);
  final int maxCapacity;
}
