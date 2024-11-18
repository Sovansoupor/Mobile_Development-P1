import 'package:flutter/material.dart';
import 'profile_tile_model.dart';
 
ProfileData ronanProfile = ProfileData(
    name: "Ronan",
    position: "Flutter Developer",
    avatarUrl: 'assets/avatar.png',
    tiles: [
      TileData( icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
      TileData(icon: Icons.web, title: "Website", value: "www.netflix.com"),
      TileData(icon: Icons.linked_camera, title: "Instagram", value: "@ronanogogr"),
      TileData(icon: Icons.apple, title: "Apple ID", value: "ronan.ogogr@gmail.com"),
      TileData(icon: Icons.access_alarms_rounded, title: "Clock", value: "12:00AM"),
    ]
);
