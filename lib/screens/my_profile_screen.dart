import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/models/user.dart';
import 'package:bazartech/services/user_service.dart';
import 'package:bazartech/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
    User? user = Provider.of<LoggedUser>(context).user;
    var storage = const FlutterSecureStorage();
    return Container(
      width: 1.sw,
      color: context.backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
      child: Column(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
            ),
            radius: 100,
          ),
          Text(
            user?.name ?? "",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text('@${user?.username}'),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const Icon(FontAwesomeIcons.envelope),
              const SizedBox(
                width: 15,
              ),
              Text(user?.email ?? ""),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const Icon(FontAwesomeIcons.birthdayCake),
              const SizedBox(
                width: 15,
              ),
              Text(user != null
                  ? DateFormat("dd/MM/yyyy")
                      .format(DateTime.parse(user.birthdate).toLocal())
                      .toString()
                  : ""),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const Icon(FontAwesomeIcons.phone),
              const SizedBox(
                width: 15,
              ),
              Text(user?.phoneNumber ?? ""),
            ],
          ),
          const Spacer(),
          DefaultButton(
            color: context.primaryColor,
            label: 'Editar',
            width: double.infinity,
            onPressed: () => {},
          ),
          DefaultButton(
            color: context.errorColor,
            labelColor: context.onErrorColor,
            label: 'Sair',
            width: double.infinity,
            onPressed: () => {
              Navigator.of(context).popAndPushNamed('/login'),
              Provider.of<LoggedUser>(context, listen: false).logout(),
              UserService().deleteToken()
            },
          ),
        ],
      ),
    );
  }
}
