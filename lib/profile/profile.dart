// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lmr/services/auth.dart';
import 'package:lmr/services/firestore.dart';
import 'package:lmr/services/models.dart';

class Profile extends StatefulWidget {
  static const routeName = "/profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: Colors.blue[400],
          leading: const BackButton(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        body: FutureBuilder(
            future: FirestoreService().getUser(AuthService().user!.uid),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                User user = snapshot.data as User;
                return SafeArea(
                    child: Column(
                  children: [
                    //for circle avtar image
                    _getHeader(),
                    const SizedBox(
                      height: 10,
                    ),
                    _profileName(user.displayName),
                    const SizedBox(
                      height: 14,
                    ),
                    _heading("Personal Details"),
                    const SizedBox(
                      height: 6,
                    ),
                    _detailsCard(user),
                    const SizedBox(
                      height: 10,
                    ),
                    _heading("Academic Details"),
                    const SizedBox(
                      height: 6,
                    ),
                    _settingsCard(user),
                    const Spacer(),
                    logoutButton()
                  ],
                ));
              } else {
                return const Text('loading');
              }
            })));
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            margin: new EdgeInsets.only(top: 100.0),
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              //borderRadius: BorderRadius.all(Radius.circular(10.0)),
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("assets/profile.png")),
              // color: Colors.orange[100],
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileName(String name) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      margin: new EdgeInsets.only(bottom: 50),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _detailsCard(User user) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(user.email),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
           
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Navi Mumbai"),
            )
          ],
        ),
      ),
    );
  }

  Widget _settingsCard(User user) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            ListTile(
              leading: const Icon(Icons.school),
              title: Text(user.programme),
            ),
            const Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            const ListTile(
              leading: Icon(Icons.church),
              title: Text("Mumbai University"),
            ),
            const Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.workspaces),
              title: Text("SEM ${user.sem}"),
            )
          ],
        ),
      ),
    );
  }

  Widget logoutButton() {
    return Container(
      child: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          )),
    );
  }
}
