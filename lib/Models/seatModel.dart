class Seat {
  String seatLabel;
  bool isSelected;
  bool isAssisted;
  bool isAvailable;

  Seat({
    this.seatLabel,
    this.isSelected,
    this.isAssisted,
    this.isAvailable = true
  });
}