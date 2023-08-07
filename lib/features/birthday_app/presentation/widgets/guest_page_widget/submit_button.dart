import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitButton extends StatelessWidget {
  void Function()? onPressed;
  SubmitButton({
    super.key,
    required this.onPressed,
    required this.nameController,
    required this.surnameController,
    required this.birthdateController,
    required this.professionController,
    required this.numberController,
  });

  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController birthdateController;
  final TextEditingController professionController;
  final TextEditingController numberController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        fixedSize: const Size(156, 50),
        backgroundColor: const Color.fromRGBO(71, 128, 42, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
      ),
      onPressed: onPressed,
      child: const Text(
        'Записаться',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
