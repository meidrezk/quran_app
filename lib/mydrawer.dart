//
// import 'package:flutter/material.dart';
// import 'package:quran/conistants.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:quran/settings.dart';
//
//
//
// class MyDrawer extends StatelessWidget {
//   const MyDrawer({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: const BoxDecoration(
//               color: Colors.white,
//             ),
//             child: Column(
//               children: [
//                 Image.asset(
//                   'assets/quran.png',
//                   height: 80,
//                 ),
//                 const Text(
//                   'Al Quran',
//                   style: TextStyle(fontSize: 20),
//                 ),
//
//               ],
//             ),
//           ),
//
//           ListTile(
//             leading: const Icon(
//               Icons.settings,
//             ),
//             title: const Text(
//               'Settings',
//             ),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const Settings()));
//             },
//           ),
//
//           ListTile(
//             leading: const Icon(
//               Icons.share,
//             ),
//             title: const Text(
//               'Share',
//             ),
//             onTap: () {
//               Share.share('''*Quran app*\n
// You can download quran app from :
// https://t.me/+ZeGPMSokKsZkYWE0''');
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             leading: const Icon(
//               Icons.rate_review,
//             ),
//             title: const Text(
//               'Rate',
//             ),
//             onTap: () async {
//               if (!await launchUrl(quranAppurl,
//                   mode: LaunchMode.externalApplication)) {
//                 throw 'Could not launch $quranAppurl';
//               }
//             },
//           ),
//
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:quran/settings.dart';

import 'conistants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/quran.png',
                  height: 80,
                ),
                const Text(
                  'Al Quran',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.blue, // Example color
            ),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
              color: Colors.blue,
            ),
            title: const Text('Share'),
            onTap: () {
              Share.share('''*Quran app*\n
You can download the Quran app from: 
https://t.me/+ZeGPMSokKsZkYWE0''');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.rate_review,
              color: Colors.blue,
            ),
            title: const Text('Rate'),
            onTap: () async {
              final bool launched = await launchUrl(quranAppurl,
                  mode: LaunchMode.externalApplication);
              if (!launched) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Could not open the rating page.')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
