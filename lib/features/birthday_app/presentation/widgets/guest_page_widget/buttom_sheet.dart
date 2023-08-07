import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/guest_page_widget/submit_button.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/guest_page_widget/form.dart';

class BottomSheetWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController birthdateController;
  final TextEditingController professionController;
  final TextEditingController numberController;
  final int? index;
  final void Function()? onSubmitPressed;

  const BottomSheetWidget({
    super.key,
    required this.nameController,
    required this.surnameController,
    required this.birthdateController,
    required this.professionController,
    required this.numberController,
    this.index,
    this.onSubmitPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                height: 3.h,
                color: const Color.fromARGB(255, 226, 224, 224),
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FormWidget(
                    nameController: nameController,
                    surnameController: surnameController,
                    birthdateController: birthdateController,
                    professionController: professionController,
                    numberController: numberController,
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    height: 50.h,
                  ),
                  SubmitButton(
                    onPressed: onSubmitPressed,
                    nameController: nameController,
                    surnameController: surnameController,
                    birthdateController: birthdateController,
                    professionController: professionController,
                    numberController: numberController,
                  ),
                  SizedBox(
                    height: 150.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
