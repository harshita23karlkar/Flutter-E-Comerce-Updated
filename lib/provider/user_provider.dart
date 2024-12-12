import 'package:e_commerce_app/api_services/user_api.dart';
import 'package:e_commerce_app/models/userdetails_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserDetailsModel? _userDetails;

  // Getter for user details
  UserDetailsModel? get userDetails => _userDetails;

  // Method to fetch and set user details
  Future<void> fetchAndSetUserDetails() async {
    try {
      // Fetch user details using your function
      final userDetails = await UserApiService().fetchUserDetails();
      if (userDetails != null) {
        _userDetails = userDetails;
        notifyListeners(); // Notify listeners about the state change
      }
    } catch (e) {
      debugPrint("Error fetching user details: $e");
    }
  }
}
