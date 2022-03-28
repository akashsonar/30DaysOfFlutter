import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.teal,
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.teal),
                margin: EdgeInsets.zero,
                accountName: Text(
                  "Akash Sonar",
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold),
                ),
                accountEmail: Text("sonarakash888gmail.com",
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold)),
                currentAccountPicture: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.lime,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/mountain.png"),
                    radius: 32,
                  ),
                ),
              )),
          ListTile(
            leading: const Icon(CupertinoIcons.home, color: Colors.white),
            title: Text("Home",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
          ListTile(
            onTap: () async {
              if (!await launch(
                  'https://www.linkedin.com/in/akash-sonar-038777221')) {
                throw 'Could not launch Linkedin';
              }
            },
            leading:
                const FaIcon(FontAwesomeIcons.linkedinIn, color: Colors.white),
            title: Text("Linkedin",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
          ListTile(
            onTap: () async {
              if (!await launch('https://www.instagram.com/akash__sonar__')) {
                throw 'Could not launch Instagram';
              }
            },
            leading: const FaIcon(FontAwesomeIcons.instagram, color: Colors.white,),
            title: Text("Instagram",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
          ListTile(
            onTap: () async {
              if (!await launch(
                  'https://api.whatsapp.com/send?phone=+919604610267')) {
                throw 'Could not launch Whatssapp';
              }
            },
            leading: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
            title: Text("Whatsapp",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
          ListTile(
            onTap: () async {
              await Navigator.pushNamed(context, MyRoutes.loginRoute);
            },
            leading: const FaIcon(FontAwesomeIcons.arrowRightFromBracket, color: Colors.white,),
            title: Text("Logout",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          )
        ]),
      ),
    );
  }
}
