import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

///Class for adding contact details/profile details as a complete new page in your flutter app.
class ContactUs extends StatelessWidget {
  ///Logo of the Company/individual
  final ImageProvider? logo;

  ///Ability to add an image
  final Image? image;

  ///Phone Number of the company/individual
  final String? phoneNumber;

  ///Text for Phonenumber
  final String? phoneNumberText;

  ///Website of company/individual
  final String? website;

  ///Text for Website
  final String? websiteText;

  ///Email ID of company/individual
  final String email;

  ///Text for Email
  final String? emailText;

  ///Twitter Handle of Company/Individual
  final String? twitterHandle;

  ///Facebook Handle of Company/Individual
  final String? facebookHandle;

  ///Linkedin URL of company/individual
  final String? linkedinURL;

  ///Github User Name of the company/individual
  final String? githubUserName;

  ///Name of the Company/individual
  final String companyName;

  ///Font size of Company name
  final double? companyFontSize;

  ///TagLine of the Company or Position of the individual
  final String? tagLine;

  ///Instagram User Name of the company/individual
  final String? instagram;

  ///TextColor of the text which will be displayed on the card.
  final Color textColor;

  ///Color of the Card.
  final Color cardColor;

  ///Color of the company/individual name displayed.
  final Color companyColor;

  ///Color of the tagLine of the Company/Individual to be displayed.
  final Color taglineColor;

  /// font of text
  final String? textFont;

  /// font of the company/individul to be displayed
  final String? companyFont;

  /// font of the tagline to be displayed
  final String? taglineFont;

  /// divider color which is placed between the tagline & contact informations
  final Color? dividerColor;

  /// divider thickness which is placed between the tagline & contact informations
  final double? dividerThickness;

  ///font weight for tagline and company name
  final FontWeight? companyFontWeight;
  final FontWeight? taglineFontWeight;

  /// avatar radius will place the circularavatar according to developer/UI need
  final double? avatarRadius;

  ///Constructor which sets all the values.
  const ContactUs({Key? key, 
    required this.companyName,
    required this.textColor,
    required this.cardColor,
    required this.companyColor,
    required this.taglineColor,
    required this.email,
    this.emailText,
    this.logo,
    this.image,
    this.phoneNumber,
    this.phoneNumberText,
    this.website,
    this.websiteText,
    this.twitterHandle,
    this.facebookHandle,
    this.linkedinURL,
    this.githubUserName,
    this.tagLine,
    this.instagram,
    this.companyFontSize,
    this.textFont,
    this.companyFont,
    this.taglineFont,
    this.dividerColor,
    this.companyFontWeight,
    this.taglineFontWeight,
    this.avatarRadius,
    this.dividerThickness,
  }) : super(key: key);

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 8.0,
          contentPadding: const EdgeInsets.all(18.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              
              const Divider(),
              InkWell(
                onTap: () => launch('sms:' + phoneNumber!),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: const Text('Message'),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () => launch('https://wa.me/' + phoneNumber!),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: const Text('WhatsApp'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: logo != null,
                child: CircleAvatar(
                  radius: avatarRadius ?? 100.r,
                  backgroundImage: logo,
                  backgroundColor: Theme.of(context).primaryColorLight,
                ),
              ),
              Visibility(
                  visible: image != null, child: image ?? const SizedBox.shrink()),
              SizedBox(height: 8.h,),
              Text(
                companyName,
                style: TextStyle(
                  fontFamily: companyFont ?? 'Pacifico',
                  fontSize: companyFontSize ?? 24.sp,
                  color: companyColor,
                  fontWeight: companyFontWeight ?? FontWeight.bold,
                ),
              ),
              Visibility(
                visible: tagLine != null,
                child: Text(
                  tagLine ?? "",
                  style: TextStyle(
                    fontFamily: taglineFont ?? 'Pacifico',
                    color: taglineColor,
                    fontSize: 20.0,
                    letterSpacing: 2.0,
                    fontWeight: taglineFontWeight ?? FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Divider(
                color: dividerColor ?? Colors.teal[200],
                thickness: dividerThickness ?? 4.0,
                indent: 50.0,
                endIndent: 50.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Visibility(
                visible: website != null,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  color: cardColor,
                  child: ListTile(
                    leading: const Icon(Icons.link),
                    title: Text(
                      websiteText ?? 'Website',
                      style: TextStyle(
                        color: textColor,
                        fontFamily: textFont,
                      ),
                    ),
                    onTap: () => launch(website!),
                  ),
                ),
              ),
              Visibility(
                visible: phoneNumber != null,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  color: cardColor,
                  child: ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text(
                      phoneNumberText ?? 'Phone Number',
                      style: TextStyle(
                        color: textColor,
                        fontFamily: textFont,
                      ),
                    ),
                    onTap: () => showAlert(context),
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                color: cardColor,
                child: ListTile(
                  leading: const Icon(Icons.mail),
                  title: Text(
                    emailText ?? 'Email ID',
                    style: TextStyle(
                      color: textColor,
                      fontFamily: textFont,
                    ),
                  ),
                  onTap: () => launch('mailto:' + email),
                ),
              ),
              Visibility(
                visible: twitterHandle != null,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  color: cardColor,
                  child: ListTile(
                    leading: const Icon(Icons.mediation),
                    title: Text(
                      'Twitter',
                      style: TextStyle(
                        color: textColor,
                        fontFamily: textFont,
                      ),
                    ),
                    onTap: () => launch('https://twitter.com/' + twitterHandle!),
                  ),
                ),
              ),
              Visibility(
                visible: facebookHandle != null,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  color: cardColor,
                  child: ListTile(
                    // leading: Icon(Typicons.social_facebook),
                    title: Text(
                      'Facebook',
                      style: TextStyle(
                        color: textColor,
                        fontFamily: textFont,
                      ),
                    ),
                    onTap: () =>
                        launch('https://www.facebook.com/' + facebookHandle!),
                  ),
                ),
              ),
              Visibility(
                visible: instagram != null,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  color: cardColor,
                  child: ListTile(
                    // leading: Icon(Typicons.social_instagram),
                    title: Text(
                      'Instagram',
                      style: TextStyle(
                        color: textColor,
                        fontFamily: textFont,
                      ),
                    ),
                    onTap: () => launch('https://instagram.com/' + instagram!),
                  ),
                ),
              ),
              Visibility(
                visible: githubUserName != null,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  color: cardColor,
                  child: ListTile(
                    // leading: Icon(Typicons.social_github),
                    title: Text(
                      'Github',
                      style: TextStyle(
                        color: textColor,
                        fontFamily: textFont,
                      ),
                    ),
                    onTap: () => launch('https://github.com/' + githubUserName!),
                  ),
                ),
              ),
              Visibility(
                visible: linkedinURL != null,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  color: cardColor,
                  child: ListTile(
                    // leading: Icon(Typicons.social_linkedin),
                    title: Text(
                      'Linkedin',
                      style: TextStyle(
                        color: textColor,
                        fontFamily: textFont,
                      ),
                    ),
                    onTap: () => launch(linkedinURL!),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///Class for adding contact details of the developer in your bottomNavigationBar in your flutter app.
class ContactUsBottomAppBar extends StatelessWidget {
  ///Color of the text which will be displayed in the bottomNavigationBar
  final Color textColor;

  ///Color of the background of the bottomNavigationBar
  final Color backgroundColor;

  ///Email ID Of the company/developer on which, when clicked by the user, the respective mail app will be opened.
  final String email;

  ///Name of the company or the developer
  final String companyName;

  ///Size of the font in bottomNavigationBar
  final double fontSize;

  /// font of text
  final String? textFont;

  const ContactUsBottomAppBar({Key? key, 
    required this.textColor,
    required this.backgroundColor,
    required this.email,
    required this.companyName,
    this.fontSize = 15.0,
    this.textFont,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        onSurface: Colors.grey,
        shadowColor: Colors.transparent,
      ),
      child: Text(
        'Developed by $companyName 💙\nWant to contact?',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: textColor, fontSize: fontSize, fontFamily: textFont),
      ),
      onPressed: () => launch('mailto:$email'),
    );
  }
}