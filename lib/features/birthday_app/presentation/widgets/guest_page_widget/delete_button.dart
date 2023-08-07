import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/guest_bloc.dart';
import '../../bloc/guest_event.dart';


class DeleteButton extends StatelessWidget {
  final int index;
  const DeleteButton({super.key, required this.index});

  void _deleteGuest(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Удалить гостя',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          content: Text(
            'Вы уверены, что хотите удалить гостя?',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Отменить',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.green),
              ),
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<GuestBloc>(context)
                    .add(DeleteGuestEvent(index));
                Navigator.pop(context);
              },
              child: Text(
                'Удалить',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteGuest(context, index),
                  );
  }
}