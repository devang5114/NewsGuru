import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/spacer.dart';
import 'package:transparent_image/transparent_image.dart';

import '../comman/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool darkMode = false;
  bool notification = false;
  bool privateAc = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: pStyle.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              mediumHeightSpcer,
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: size.height * 0.2,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(children: [
                  CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: const NetworkImage(
                            "https://img.freepik.com/free-photo/portrait-successful-man-having-stubble-posing-with-broad-smile-keeping-arms-folded_171337-1267.jpg"),
                        fit: BoxFit.cover,
                        height: 125,
                        width: 130,
                      ),
                    ),
                  ),
                  mediumWidthSpcer,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mediumHeightSpcer,
                      Text('Michael Faradeyy',
                          style: pStyle.copyWith(
                              fontWeight: FontWeight.w800, fontSize: 15)),
                      Text(
                        'michael@gmail.com',
                        style: pStyle,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'SignOut',
                            style: pStyle,
                          ))
                    ],
                  )
                ]),
              ),
              mediumHeightSpcer,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SwitchListTile(
                        inactiveThumbColor: Colors.grey,
                        title: Text(
                          'Dark Mode',
                          style: pStyle.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        value: darkMode,
                        onChanged: (val) {
                          setState(() {
                            darkMode = val;
                          });
                        }),
                    SwitchListTile(
                        inactiveThumbColor: Colors.grey,
                        title: Text(
                          'Notification',
                          style: pStyle.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        value: notification,
                        onChanged: (val) {
                          setState(() {
                            notification = val;
                          });
                        })
                  ],
                ),
              ),
              smallHeightSpcer,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(
                  'Account',
                  style: pStyle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      onTap: () {},
                      title: Text(
                        'Edit Account',
                        style: pStyle.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text(
                        'Change Password',
                        style: pStyle.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text(
                        'Language',
                        style: pStyle.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ],
                ),
              ),
              smallHeightSpcer,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(
                  'Privacy and Security',
                  style: pStyle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SwitchListTile(
                        inactiveThumbColor: Colors.grey,
                        title: Text(
                          'Private Account',
                          style: pStyle.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        value: privateAc,
                        onChanged: (val) {
                          setState(() {
                            privateAc = val;
                          });
                        }),
                    ListTile(
                      title: Text(
                        'Privacy and Security Help',
                        style: pStyle.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
