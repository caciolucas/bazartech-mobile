import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/models/user.dart';
import 'package:bazartech/state/state.dart';
import 'package:bazartech/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../state/logged_user.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<LoggedUser>(context).user;
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
          Text('@${user.username}'),
          const SizedBox(
            height: 25,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
            child: Row(
              children: [
                const Icon(FontAwesomeIcons.envelope),
                const SizedBox(
                  width: 15,
                ),
                Text(user.email),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
            child: Row(
              children: [
                const Icon(FontAwesomeIcons.birthdayCake),
                const SizedBox(
                  width: 15,
                ),
                Text(DateFormat("dd/MM/yyyy")
                    .format(DateTime.parse(user.birthdate).toLocal())
                    .toString()),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
            child: Row(
              children: [
                const Icon(FontAwesomeIcons.phone),
                const SizedBox(
                  width: 15,
                ),
                Text(user.phoneNumber),
              ],
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: DefaultButton(
              color: context.errorColor,
              label: 'Sair',
              width: double.infinity,
              onPressed: () =>
                  {Navigator.of(context).popAndPushNamed('/login')},
            ),
          ))
        ],
      ),
    );
  }
}
