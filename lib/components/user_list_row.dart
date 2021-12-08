import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/app_title.dart';
import 'package:flutter_application_2/users_list/models/users_list_model.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final Function onTap;
  UserListRow({this.userModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              text: userModel.name,
            ),
            Text(userModel.email, style: TextStyle(color: Colors.black))
          ],
        ),
      ),
    );
  }
}
