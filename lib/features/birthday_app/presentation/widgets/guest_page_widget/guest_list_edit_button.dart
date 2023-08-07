import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/guest_page_widget/buttom_sheet.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/guest_page_widget/guest_list_item.dart';
import '../../../domain/enteties/guest.dart';
import '../../bloc/guest_bloc.dart';
import '../../bloc/guest_event.dart';
import '../../bloc/guest_state.dart';
import '../../pages/guest_page.dart';

class GuestList extends StatelessWidget {
  const GuestList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuestBloc, GuestState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.guests.length,
          itemBuilder: (context, index) {
            final guest = state.guests[index];
            return GestureDetector(
              onDoubleTap: () => _editGuest(
                context,
                index,
                guest.name,
                guest.birthDate,
                guest.profession,
                guest.surname,
                guest.number,
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: GuestListItem(guest: guest, index: index,),
              ),
            );
          },
        );
      },
    );
  }

  void _editGuest(BuildContext context, int index, String name, String age,
      String profession, String surname, String number) {
    final nameController = TextEditingController(text: name);
    final surnameController = TextEditingController(text: surname);
    final birthdateController = TextEditingController(text: age);
    final professionController = TextEditingController(text: profession);
    final numberController = TextEditingController(text: number);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return BottomSheetWidget(
          onSubmitPressed: () {
            if (formKey.currentState!.validate()) {
              final name = nameController.text;
              final surname = surnameController.text;
              final birthDate = birthdateController.text;
              final profession = professionController.text;
              final number = numberController.text;

              final guest = Guest(name, surname, birthDate, profession, number);
              BlocProvider.of<GuestBloc>(context)
                  .add(EditGuestEvent(index, guest));
              Navigator.pop(context);
            }
          },
          nameController: nameController,
          surnameController: surnameController,
          birthdateController: birthdateController,
          professionController: professionController,
          numberController: numberController,
          index: index,
        );
      },
    );
  }
}

