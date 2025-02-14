import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/states/profile/profile_bloc.dart';
import '../../../data/states/profile/profile_event.dart';
import '../../../data/states/profile/profile_state.dart';
import '../../navigation/navigation.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _selectedImage;
  final TextEditingController _nameController = TextEditingController();

  ProfileBloc get _profileBloc => context.read<ProfileBloc>();

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final File selectedFile = File(image.path);
      setState(() {
        _selectedImage = selectedFile;
      });

      _profileBloc.add(AddProfileImage(selectedFile));
    }
  }

  void _showEditNameDialog() {
    _nameController.text = _profileBloc.state.user?.screenName ?? '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Name'),
        content: TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Name',
            hintText: 'Enter your new name',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_nameController.text.isNotEmpty) {
                _profileBloc
                    .add(UpdateProfile({'screenName': _nameController.text}));
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _profileBloc.add(ProfileLoad());
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color(0xFFFF6347),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state.isUpdating && state.user == null) {
          // Show loader when data is being fetched
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        String? imageUrl = state.uploadedImageUrl ?? state.user?.picture;
        print(' new image url ${state.uploadedImageUrl}');
        print(' old image from usermodel ${state.user?.picture}');

        if (imageUrl != null && !imageUrl.startsWith('file://')) {
          imageUrl = "https://pizzajournals.com/places/$imageUrl";
        }

        return Scaffold(
          appBar: AppBar(
            leading: const BackButton(),
            title: const Text("Account"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[200],
                            backgroundImage: imageUrl != null
                                ? (imageUrl.startsWith('file://')
                                    ? FileImage(File(imageUrl)) as ImageProvider
                                    : NetworkImage(imageUrl) as ImageProvider)
                                : null,
                            child: imageUrl == null
                                ? const Icon(Icons.person,
                                    size: 50, color: Colors.grey)
                                : null,
                          ),
                          if (state.isUpdating)
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFF6347),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: _showEditNameDialog,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.user?.screenName ?? '',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.edit, size: 20),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        state.user?.email ?? '',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildMenuItem(
                  icon: Icons.location_on_outlined,
                  title: 'My Places',
                  onTap: () =>
                      AutoRouter.of(context).push(const MyPlacesRoute()),
                ),
                _buildMenuItem(
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  onTap: () =>
                      AutoRouter.of(context).push(const ProfileRoute()),
                ),
                _buildMenuItem(
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () => _profileBloc.add(ProfileLogout()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
