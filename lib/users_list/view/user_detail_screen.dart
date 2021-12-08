import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/app_title.dart';
import 'package:flutter_application_2/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(usersViewModel.selectedUser.name),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              text: usersViewModel.selectedUser.name,
            ),
            Text(usersViewModel.selectedUser.email,
                style: TextStyle(color: Colors.black))
          ],
        ),
      ),
    );
  }
}
