import 'package:flutter/material.dart';
import 'profile_tile_model.dart';
import 'profile_data.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(profileData: ronanProfile),
  ));
}

const Color mainColor = Color(0xff5E9FCD);

class ProfileApp extends StatelessWidget {
  final ProfileData profileData;

  const ProfileApp({required this.profileData,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withAlpha(100),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                    profileData.avatarUrl), 
              ),
              const SizedBox(height: 20),
              Text(
                profileData.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              Text(
                profileData.position,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              //loop
              ListView.builder(
                shrinkWrap: true, //allow listview to adjust size based on its content
                physics: const NeverScrollableScrollPhysics(), 
                 itemCount: profileData.tiles.length, //to ensure it creates only as many items as there are in the tile list
                 itemBuilder: (context, index){ // its a callback function- defines how to build each item in the list
                  final tile = profileData.tiles[index]; // inside function, we access the tiledata at the given index
                  // to create profileTile widget using data from tileData obj
                  return ProfileTile(
                    icon: tile.icon,
                    title: tile.title, 
                    data: tile.value,
                  );
                 },
              )
              
              // this is manual hardcoded
              // const ProfileTile(
              //   icon: Icons.phone,
              //   title: "Phone Number",
              //   data: "+123 456 7890",
              // ),
              
              //  const ProfileTile(
              //   icon: Icons.location_on,
              //   title: "Address",
              //   data: "Cambodia",
              // ),
            ],
          ),
      ),
      );
    
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: mainColor),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
