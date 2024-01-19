import 'package:flutter/material.dart';
import 'package:machine_test_esc/post/models/post.dart';
import 'package:url_launcher/url_launcher.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("Details of ${post.firstName}"),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Center(
              child:  ListTile(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text("Details of ${post.firstName}",
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          SizedBox(height: 20,),
          Container(
            height: MediaQuery.of(context).size.height/1.165,
            decoration:  const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
              color: Color(0xdffcbc3e3),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  CircleAvatar(
                      radius: 70,
                      child: ClipOval(
                          child: Image.network(post.profilePicture)
                      )
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "${post.firstName} ${post.lastName}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ListTile(
                    leading: post.gender == "female" ? const Icon(Icons.female): const Icon(Icons.male),
                    title: Text(
                      post.gender,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.cases_outlined),
                    title: Text(
                      post.job,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.email_outlined),
                    title: Text(
                      post.email,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone_android),
                    title: Text(
                      post.phone,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_month),
                    title: Text(
                      post.dateOfBirth.substring(0,10),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_pin),
                    title: Text(
                      "${post.street},${post.city},${post.zipcode},${post.country},${post.state}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onTap: (){
                      launchURL();
                    },
                  ),
                ],
              ),
            ),
          )
          ],
        )
      ),
    );
  }

  launchURL() async {

     final String googleMapslocationUrl = "https://www.google.com/maps/search/?api=1&query=${post.latitude},${post.longitude}";



    final String encodedURl = Uri.encodeFull(googleMapslocationUrl);

    if (await canLaunch(encodedURl)) {
      await launch(encodedURl);
    } else {
      print('Could not launch $encodedURl');
      throw 'Could not launch $encodedURl';
    }
  }



}