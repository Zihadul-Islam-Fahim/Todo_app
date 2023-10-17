import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DevInfo extends StatelessWidget {
  const DevInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Developer Info',
          style: GoogleFonts.notoSansAnatolianHieroglyphs(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 250,
              width: 250,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.hardEdge,
              child: CircleAvatar(
                  minRadius: 0.01,
                  child: Image.network(
                    'https://media.licdn.com/dms/image/C4E03AQHJ8LtqURnpyQ/profile-displayphoto-shrink_800_800/0/1636519099990?e=1702512000&v=beta&t=jjdpJjlcW6CigxvFZwCm-VjpZCBuD_YOKJUllRmHuAs',
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "fahimzihad@gmail.com",
              style: GoogleFonts.notoSansAnatolianHieroglyphs(fontSize: 15),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              "Zihadul Islam Fahim",
              style: GoogleFonts.notoSansAnatolianHieroglyphs(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
