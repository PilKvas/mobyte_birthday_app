import 'package:equatable/equatable.dart';

import '../../domain/enteties/guest.dart';

abstract class GuestEvent extends Equatable {
  const GuestEvent();

  @override
  List<Object> get props => [];
}

class AddGuestEvent extends GuestEvent {
  final Guest guest;

  const AddGuestEvent(this.guest);

  @override
  List<Object> get props => [guest];
}

class EditGuestEvent extends GuestEvent {
  final int index;
  final Guest newGuest;

  const EditGuestEvent(this.index, this.newGuest);

  @override
  List<Object> get props => [index, newGuest];
}

class DeleteGuestEvent extends GuestEvent {
  final int index;

  const DeleteGuestEvent(this.index);

  @override
  List<Object> get props => [index];
}

class ChangeSortOrderEvent extends GuestEvent {
  final String sortOrder;

  const ChangeSortOrderEvent(this.sortOrder);

  @override
  List<Object> get props => [sortOrder];
}
