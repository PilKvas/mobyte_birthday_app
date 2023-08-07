import 'package:flutter/material.dart';
import 'package:mobyte_birthday_app/constants/app_images.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/guest_page_widget/delete_button.dart';

class GuestListItem extends StatelessWidget {
  const GuestListItem({
    super.key,
    required this.guest, required this.index,
  });
  final int index;
  final guest;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        AppImages.avatar,
        fit: BoxFit.fill,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${guest.name} ${guest.surname}",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            '${guest.birthDate}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
          Text(
            '${guest.profession}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          )
        ],
      ),
      trailing: DeleteButton(
        index: index,
      ),
    );
  }
}