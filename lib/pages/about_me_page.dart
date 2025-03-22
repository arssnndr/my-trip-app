import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/biodata_data.dart';
import '../components/header.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart'
    show ByteData, Uint8List, rootBundle, Clipboard, ClipboardData;
import 'dart:io';
import 'package:open_file/open_file.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  bool showGithubLinkText = false;
  bool showWhatsAppLinkText = false;

  Future<void> _launchUrl() async {
    final Uri gDriveUri = Uri.parse(biodata.googleDriveUrl);
    if (await canLaunchUrl(gDriveUri)) {
      await launchUrl(gDriveUri, mode: LaunchMode.platformDefault);
      setState(() => showWhatsAppLinkText = false);
    } else {
      setState(() => showWhatsAppLinkText = true);
      Clipboard.setData(ClipboardData(text: biodata.googleDriveUrl));
    }
  }

  Future<void> _openFile() async {
    final ByteData bytes = await rootBundle.load('assets/files/CV.pdf');
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/file.pdf').create();
    file.writeAsBytesSync(list);

    final result = await OpenFile.open(file.path);
    if (result.type != ResultType.done) {
      _launchUrl();
    }
  }

  Future<void> _launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse(biodata.whatsappUrl);
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.platformDefault);
      setState(() => showWhatsAppLinkText = false);
    } else {
      setState(() => showWhatsAppLinkText = true);
      Clipboard.setData(ClipboardData(text: biodata.whatsappUrl));
    }
  }

  Future<void> _launchGithub() async {
    final Uri githubUri = Uri.parse(biodata.githubUrl);
    if (await canLaunchUrl(githubUri)) {
      await launchUrl(githubUri, mode: LaunchMode.platformDefault);
      setState(() => showGithubLinkText = false);
    } else {
      setState(() => showGithubLinkText = true);
      Clipboard.setData(ClipboardData(text: biodata.githubUrl));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        searchController: TextEditingController(),
        onSearchChanged: (String value) {},
        title: 'About Me',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'name:',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                Text(
                  biodata.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'email:',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                Text(
                  biodata.email,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'phone:',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                Text(
                  biodata.phone,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'whatsapp:',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: _launchWhatsApp,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.white,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(8),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/whatsapp-logo.svg',
                    width: 40,
                    height: 40,
                  ),
                ),
                if (showWhatsAppLinkText)
                  Text(
                    biodata.whatsappUrl,
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                SizedBox(height: 12),
                Text(
                  'github:',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: _launchGithub,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(8),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/github-logo.svg',
                    width: 40,
                    height: 40,
                  ),
                ),
                if (showGithubLinkText)
                  Text(
                    biodata.githubUrl,
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                SizedBox(height: 12),
                Text(
                  'address:',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                Text(
                  biodata.address,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'bio:',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 2),
                Text(
                  biodata.bio,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                MouseRegion(
                  child: ElevatedButton(
                    onPressed: _openFile,
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.resolveWith<Color?>((
                        Set<WidgetState> states,
                      ) {
                        if (states.contains(WidgetState.hovered)) {
                          return Colors.blue.withAlpha(25);
                        }
                        return null;
                      }),
                    ),
                    child: Text(
                      'View My CV',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
