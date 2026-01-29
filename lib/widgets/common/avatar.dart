import 'package:flutter/material.dart';
import 'package:ytnkio/repos/avatar_repository.dart';

class Avatar extends StatelessWidget {
  final String profileId;

  const Avatar({super.key, required this.profileId});

  Future<ImageProvider> fetchAvatar() async {
    final response = await AvatarRepository().getProfileAvatar(profileId);

    if (response.isSuccess) {
      return MemoryImage(response.responseObject!);
    } else {
      return Image.asset('lib/assets/images/user.png').image;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.deepPurple,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: FutureBuilder(
              future: fetchAvatar(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return CircleAvatar(
                    backgroundImage: snapshot.data!,
                    radius: 30,
                  );
                }
              }),
        ));
  }
}
