import 'package:busyatra/Models/seatAud.dart';
import 'package:busyatra/Models/seatModel.dart';
import 'package:flutter/material.dart';

class SeatSelectionService extends ChangeNotifier {

  List<Seat> _selectedSeats = [];
  SeatAudModel _audModel = SeatAudModel();

  List<Seat> get selectedSeats => _selectedSeats;
  SeatAudModel get auditorium => _audModel;

  void resetSeatSelection() {
    _selectedSeats = [];
    _audModel.seats.forEach((List<Seat> seatRows) {
      seatRows.forEach((Seat seat) { seat.isSelected = false; });
    });
    notifyListeners();
  }

  void initializeAuditorium() {
    _audModel = SeatAudModel();
  }

  void selectSeat(Seat seat) {
    if (!_selectedSeats.contains(seat)) {
      seat.isSelected = true;
      _selectedSeats.add(seat);
      notifyListeners();
    }
  }
}