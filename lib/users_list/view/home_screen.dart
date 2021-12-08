import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/app_error.dart';
import 'package:flutter_application_2/components/app_loading.dart';
import 'package:flutter_application_2/components/user_list_row.dart';
import 'package:flutter_application_2/users_list/models/users_list_model.dart';
import 'package:flutter_application_2/users_list/view_models/users_view_model.dart';
import 'package:flutter_application_2/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Users'),
          actions: [
            IconButton(
                onPressed: () async {
                  openAddUser(context);
                },
                icon: Icon(Icons.add))
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [_ui(usersViewModel)],
          ),
        ));
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return AppLoading();
    }
    if (usersViewModel.userError != null) {
      return AppError(
        errorTxt: usersViewModel.userError.message,
      );
    }
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              UserModel userModel = usersViewModel.userListModel[index];
              return UserListRow(
                userModel: userModel,
                onTap: () async {
                  usersViewModel.setSelectedUser(userModel);
                  openUserDetails(context);
                },
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: usersViewModel.userListModel.length));
  }
}
