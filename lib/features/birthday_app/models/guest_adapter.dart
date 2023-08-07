import 'package:hive/hive.dart';

import '../domain/enteties/guest.dart';

class GuestAdapter extends TypeAdapter<Guest> {
  @override
  final int typeId = 0;

  @override
  Guest read(BinaryReader reader) {
    return Guest(
      reader.read(),
      reader.read(),
      reader.read(),
      reader.read(),
      reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Guest obj) {
    writer.write(obj.name);
    writer.write(obj.surname);
    writer.write(obj.birthDate);
    writer.write(obj.profession);
    writer.write(obj.number);
  }
}
