import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/enteties/guest.dart';
import '../../domain/repositories/guest_repository.dart';
import 'guest_event.dart';
import 'guest_state.dart';

class GuestBloc extends Bloc<GuestEvent, GuestState> {
  late Box<Guest> _guestBox;
  final GuestRepository _guestRepository;

  GuestBloc(this._guestRepository) : super(const GuestState([])) {
    _initHive();
    on<AddGuestEvent>((event, emit) async {
      _guestRepository.addGuest(event.guest);
      final updatedGuests = await _guestRepository.getGuests();
      emit(GuestState(updatedGuests));
    });

    on<EditGuestEvent>((event, emit) async {
      _guestRepository.editGuest(event.index, event.newGuest);
      final updatedGuests = await _guestRepository.getGuests();
      emit(GuestState(updatedGuests));
    });

    on<DeleteGuestEvent>((event, emit) async {
      _guestRepository.deleteGuest(event.index);
      final updatedGuests = await _guestRepository.getGuests();
      emit(GuestState(updatedGuests));
    });

    on<ChangeSortOrderEvent>((event, emit) {
      if (event.sortOrder == 'asc') {
        final sortedGuests = List.from(_guestBox.values.toList());
        sortedGuests.sort((a, b) => a.name.compareTo(b.name));
        emit(GuestState(sortedGuests));
      } else if (event.sortOrder == 'age') {
        final sortedGuests = List.from(_guestBox.values.toList());
        sortedGuests.sort((a, b) => a.birthDate.compareTo(b.birthDate));
        emit(GuestState(sortedGuests));
      } else if (event.sortOrder == 'none') {
        final sortedGuests = List.from(_guestBox.values.toList());
        emit(GuestState(sortedGuests));
      }
    });
  }
  Future<void> _initHive() async {
    await Hive.initFlutter();

    _guestBox = await Hive.openBox<Guest>('guests');
    emit(GuestState(_guestBox.values.toList()));
  }
}
