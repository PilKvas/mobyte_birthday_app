import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday_app/features/birthday_app/presentation/widgets/guest_page_widget/add_button.dart';
import '../bloc/guest_bloc.dart';
import '../bloc/guest_event.dart';
import '../bloc/guest_state.dart';
import '../widgets/guest_page_widget/guest_list_edit_button.dart';

final formKey = GlobalKey<FormState>();

class GuestPage extends StatefulWidget {
  const GuestPage({super.key});

  @override
  State<GuestPage> createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  String? sortValue = "none";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.grey,
            )),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Список гостей',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontFamily: 'Jost', fontSize: 20.sp),
        ),
      ),
      body: BlocBuilder<GuestBloc, GuestState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              state.guests.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: const Text("Гостей пока нет....."),
                    )
                  : Padding(
                      padding: EdgeInsets.all(15.0.r),
                      child: state.guests.length > 1
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (state.guests.length > 1)
                                  Text(
                                      'гостей ${state.guests.length.toString()}'),
                                DropdownButton<String>(
                                  elevation: 0,
                                  value: sortValue,
                                  onChanged: (value) {
                                    sortValue = value;
                                    BlocProvider.of<GuestBloc>(context).add(
                                        ChangeSortOrderEvent(sortValue ?? ''));
                                  },
                                  items: <DropdownMenuItem<String>>[
                                    DropdownMenuItem<String>(
                                      value: 'none',
                                      child: Text(
                                        'Без сортировки',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: 'asc',
                                      child: Text(
                                        'По имени',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: 'age',
                                      child: Text('По возрасту',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : null,
                    ),
              const Expanded(
                child: GuestList(),
              ),
            ],
          );
        },
      ),
      floatingActionButton: const FloatingAddButton(),
    );
  }
}
