import 'package:hive_flutter/hive_flutter.dart';

import '../enteties/guest.dart';
import 'guest_repository.dart';

class GuestRepositoryImpl implements GuestRepository {
  late Box<Guest> _guestBox;

  @override
  Future<List<Guest>> getGuests() async {
    await _initHive();

    return _guestBox.values.toList();
  }

  @override
  Future<void> addGuest(Guest guest) async {
    await _initHive();
    _guestBox.add(guest);
  }

  @override
  Future<void> deleteGuest(int index) async {
    await _initHive();
    _guestBox.deleteAt(index);
  }

  @override
  Future<void> editGuest(int index, Guest newGuest) async {
    await _initHive();
    _guestBox.putAt(index, newGuest);
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    _guestBox = await Hive.openBox<Guest>('guests');
  }
}
