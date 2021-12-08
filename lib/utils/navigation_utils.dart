import 'package:flutter/material.dart';
import 'package:flutter_application_2/users_list/view/add_user.dart';
import 'package:flutter_application_2/users_list/view/user_detail_screen.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => UserDetailScreen()));
}

void openAddUser(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => AddUserScreen()));
}
