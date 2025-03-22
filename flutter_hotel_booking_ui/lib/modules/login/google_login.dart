// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';

// class FacebookTwitterButtonView extends StatelessWidget {
//   const FacebookTwitterButtonView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return _fTButtonUI();
//   }

//   Widget _fTButtonUI() {
//     return Container(
//       child: Row(
//         children: <Widget>[
//           const SizedBox(
//             width: 24,
//           ),
//           Expanded(
//             child: CommonButton(
//               padding: EdgeInsets.zero,
//               backgroundColor: const Color(0xff3c5799),
//               buttonTextWidget: _buttonTextUI(),
//             ),
//           ),
//           const SizedBox(
//             width: 16,
//           ),
//           Expanded(
//             child: CommonButton(
//               padding: EdgeInsets.zero,
//               backgroundColor: const Color(0xff05a9f0),
//               buttonTextWidget: _buttonTextUI(isFacebook: false),
//             ),
//           ),
//           const SizedBox(
//             width: 24,
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buttonTextUI({bool isFacebook = true}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Icon(isFacebook ? FontAwesomeIcons.facebookF : FontAwesomeIcons.twitter,
//             size: 20, color: Colors.white),
//         const SizedBox(
//           width: 4,
//         ),
//         Text(
//           isFacebook ? "Facebook" : "Twitter",
//           style: const TextStyle(
//               fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class GoogleAuthButtonView extends StatelessWidget {
//   const GoogleAuthButtonView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return _googleAuthButtonUI(context); // Pass the context here
//   }

//   Widget _googleAuthButtonUI(BuildContext context) { // Accept context as a parameter
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Expanded(
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xffdb4437), // Google red color
//                 padding: EdgeInsets.zero,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ),
//               child: _buttonTextUI(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buttonTextUI() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Icon(FontAwesomeIcons.google, size: 20, color: Colors.white),
//         const SizedBox(width: 8),
//         const Text(
//           "Sign in with Google",
//           style: TextStyle(
//               fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
//         ),
//       ],
//     );
//   }
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart' as http;
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'dart:convert';

// class GoogleAuthButtonView extends StatelessWidget {
//   const GoogleAuthButtonView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return _googleAuthButtonUI(context);
//   }

//   Widget _googleAuthButtonUI(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Expanded(
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xffdb4437),
//                 padding: EdgeInsets.zero,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ),
//               onPressed: () => _handleSignIn(context), // Add the onPressed handler
//               child: _buttonTextUI(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buttonTextUI() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Icon(FontAwesomeIcons.google, size: 20, color: Colors.white),
//         const SizedBox(width: 8),
//         const Text(
//           "Sign in with Google",
//           style: TextStyle(
//               fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
//         ),
//       ],
//     );
//   }

//   Future<void> _handleSignIn(BuildContext context) async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       if (googleUser != null) {
//         final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//         final String? idToken = googleAuth.idToken;

//         // Send idToken to your backend
//         final response = await http.post(
//           Uri.parse('http://192.168.175.22:8080/api/v1/auth/oauth/google/mobile'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({'idToken': idToken}),
//         );

//         if (response.statusCode == 200) {
//           final responseData = jsonDecode(response.body);
//           final token = responseData['token'];
//           final user = responseData['user'];

//           // Save token and user info securely
//           // Use token for authenticated requests
//         } else {
//           // Handle error
//         }
//       }
//     } catch (error) {
//       print('Error signing in: $error');
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_hotel_booking_ui/routes/route_names.dart';
import 'dart:convert';

class GoogleAuthButtonView extends StatelessWidget {
  const GoogleAuthButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _googleAuthButtonUI(context);
  }

  Widget _googleAuthButtonUI(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffdb4437),
                
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: () =>
                  _handleSignIn(context), // Add the onPressed handler
              child: _buttonTextUI(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonTextUI() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        Icon(FontAwesomeIcons.google, size: 20, color: Colors.white),
        const SizedBox(width: 8),
        const Text(
          "Sign in with Google",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }

  // Future<void> _handleSignIn(BuildContext context) async {
  //   try {
  //     // Initialize GoogleSignIn object
  //     final GoogleSignIn _googleSignIn = GoogleSignIn(
  //       scopes: [
  //         'email',
  //         'https://www.googleapis.com/auth/contacts.readonly',
  //       ],
  //     );

  //     // Trigger the Google Sign-In process
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

  //     if (googleUser != null) {
  //       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //       final String? idToken = googleAuth.idToken;

  //       if (idToken != null) {
  //         // Send idToken to your backend
  //         final response = await http.post(
  //           Uri.parse('http://192.168.175.22:8080/api/v1/auth/oauth/google/mobile'),
  //           headers: {'Content-Type': 'application/json'},
  //           body: jsonEncode({'idToken': idToken}),
  //         );

  //         if (response.statusCode == 200) {
  //           final responseData = jsonDecode(response.body);
  //           final token = responseData['token'];
  //           final user = responseData['user'];

  //           // Save token and user info securely
  //           // Use token for authenticated requests
  //           print('User: $user, Token: $token');
  //           // Navigate to main screen or relevant page
  //         } else {
  //           // Handle error response from backend
  //           print('Error: ${response.statusCode}, ${response.body}');
  //         }
  //       } else {
  //         print('Failed to retrieve idToken');
  //       }
  //     } else {
  //       print('Google Sign-In aborted by user');
  //     }
  //   } catch (error) {
  //     print('Error signing in: $error');
  //   }
  // }
  Future<void> _handleSignIn(BuildContext context) async {
    try {
      // Initialize GoogleSignIn object
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        // scopes: [
        //   'email',
        //   'https://www.googleapis.com/auth/contacts.readonly',
        // ],
        scopes: ['email', 'profile'],
        serverClientId:
            '738356216083-h9f69ldkn1aghm6cc9ak8n64oteq1nvm.apps.googleusercontent.com',
      );

      // Trigger the Google Sign-In process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      print('googleuser, ${googleUser}');

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        print('googleAuth, ${googleAuth.idToken}');
        final String? idToken = googleAuth.idToken;
        print('idtoken, ${idToken}');

        if (idToken != null) {
          // Send idToken to your backend
          final response = await http.post(
            Uri.parse(
                'http://192.168.175.22:8080/api/v1/auth/oauth/google/mobile'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'idToken': idToken}),
          );

          if (response.statusCode == 200) {
            final responseData = jsonDecode(response.body);
            final token = responseData['token'];
            final user = responseData['user'];

            // Save token and user info securely
            // Use token for authenticated requests
            print('User: $user, Token: $token');
            // Navigate to main screen or relevant page
            NavigationServices(context).gotoTabScreen();
          } else {
            // Handle error response from backend
            print('Error: ${response.statusCode}, ${response.body}');
          }
        } else {
          print(
              'Failed to retrieve idToken. GoogleSignInAuthentication: $googleAuth');
        }
      } else {
        print('Google Sign-In aborted by user');
      }
    } catch (error) {
      print('Error signing in: $error');
    }
  }
}
