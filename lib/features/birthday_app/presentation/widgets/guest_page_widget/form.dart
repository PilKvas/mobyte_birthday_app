import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/validate.dart';
import '../../pages/guest_page.dart';

class FormWidget extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController birthdateController;
  final TextEditingController professionController;
  final TextEditingController numberController;

  DateTime? birthDate;

  FormWidget(
      {super.key,
      required this.nameController,
      required this.surnameController,
      required this.birthdateController,
      required this.professionController,
      required this.numberController,
      this.birthDate});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: widget.nameController,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              labelText: 'Имя',
            ),
            validator: (value) => DefaultValidator.validateName(value),
          ),
          SizedBox(
            height: 12.h,
          ),
          TextFormField(
            controller: widget.surnameController,
            cursorColor: Colors.black,
            // decoration: textFieldTheme('Фамилия'),
            decoration: const InputDecoration(
              labelText: 'Фамилия',
            ),
            validator: (value) => DefaultValidator.validateSurname(value),
          ),
          SizedBox(
            height: 12.h,
          ),
          TextFormField(
            controller: widget.birthdateController,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              labelText: 'Дата рождения',
              suffixIcon: Icon(
                Icons.calendar_today_outlined,
              ),
            ),
            validator: (value) => DefaultValidator.validateDate(value),
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (picked != null && picked != widget.birthDate) {
                widget.birthDate = picked;
                final age = DefaultValidator.calculateAge(widget.birthDate!);
                final yearWord = DefaultValidator.getYearWord(age);
                widget.birthdateController.text = '$age $yearWord';
              }
            },
          ),
          SizedBox(
            height: 12.h,
          ),
          TextFormField(
            controller: widget.numberController,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              labelText: 'Номер',
            ),
            validator: (value) => DefaultValidator.validateNumber(value),
          ),
          SizedBox(
            height: 12.h,
          ),
          TextFormField(
            controller: widget.professionController,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              labelText: 'Профессия',
            ),
            validator: (value) => DefaultValidator.validateProfession(value),
          ),
        ],
      ),
    );
  }
}
