import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/enteties/guest.dart';
import '../../bloc/guest_bloc.dart';
import '../../bloc/guest_event.dart';
import '../../pages/guest_page.dart';
import 'buttom_sheet.dart';


class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({super.key});
void _addGuest(BuildContext context) {
      final nameController = TextEditingController();

  final surnameController = TextEditingController();

  final birthdateController = TextEditingController();

  final professionController = TextEditingController();

  final numberController = TextEditingController();

    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return BottomSheetWidget(
            nameController: nameController,
            surnameController: surnameController,
            birthdateController: birthdateController,
            professionController: professionController,
            numberController: numberController,
            onSubmitPressed: () {
          if (formKey.currentState!.validate()) {
            final name = nameController.text;
            final surname = surnameController.text;
            final birthDate = birthdateController.text;
            final profession = professionController.text;
            final number = numberController.text;

            final guest = Guest(name, surname, birthDate, profession, number);
            BlocProvider.of<GuestBloc>(context).add(AddGuestEvent(guest));
            Navigator.pop(context);
          }
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: const Color.fromRGBO(71, 128, 42, 1),
        onPressed: () => _addGuest(context),
        child: const Icon(Icons.add),
      );
  }
}