import 'package:flutter/material.dart';
import 'package:kycbscore/presentation/widgets/contact_us_widget.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        body: ContactUs(
          logo: const AssetImage('assets/images/logo.png'),
          email: 'breejemodi16@gmail.com',
          companyName: 'KYCB Score',
          phoneNumber: '+919998895761',
          dividerThickness: 2,
          website: 'https://kycbscore.herokuapp.com',
          cardColor: Theme.of(context).primaryColorLight, 
          companyColor: Theme.of(context).primaryColor, 
          taglineColor: Colors.black, 
          textColor: Colors.black,
        ),
    );
  }
}