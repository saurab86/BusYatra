import 'package:busyatra/Models/seatModel.dart';


class SeatAudModel {

  static const String idScreen ="SeatAudModel";
  int rows = 5;
  int cols = 4;
  String label;
  String seatLabels = "ABCDEFGH";
  int accessibleRow = 3;

  List<List<Seat>> seats = [];

  SeatAudModel({
    this.rows = 5,
    this.cols = 4
  }) {
    
    seats = [];
    for(int i = 0; i < rows; i++) {

      List<Seat> seatRow = [];
      for(int j = 0; j < cols; j++) {
        seatRow.add(
          Seat(
            seatLabel: seatLabels[i] + j.toString(),
            isAssisted: i == 3,
            isSelected: false
          )
        );
      }

      seats.add(seatRow);
    }

  }
}