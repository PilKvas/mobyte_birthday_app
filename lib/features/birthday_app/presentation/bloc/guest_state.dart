import 'package:equatable/equatable.dart';

class GuestState extends Equatable {
  final List<dynamic> guests;

  const GuestState(this.guests);

  @override
  List<Object> get props => [guests];
}
