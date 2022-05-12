import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/models/user.dart';
import 'package:bazartech/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  User user = MockState().user;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      color: context.backgroundColor,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://ipfs.io/ipfs/${user.profilePicture}',
            ),
            radius: 100,
          ),
          Text(
            user.name,
            style: const TextStyle(fontSize: 30),
          ),
          Text('@${user.username}')
        ],
      ),
    );
  }
}
