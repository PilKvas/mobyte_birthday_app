

import '../enteties/guest.dart';

abstract class GuestRepository {
  Future<List<Guest>> getGuests();
  Future<void> addGuest(Guest guest);
  Future<void> editGuest(int index, Guest newGuest);
  Future<void> deleteGuest(int index);
}
