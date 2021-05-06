import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User> getCurrentUser() async {
    // ignore: await_only_futures
    return await _auth.currentUser;
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    final User user = userCredential.user;
    if (user != null) {
      // Map<String, dynamic> userInfoMap = {
      //   "email": user.email,
      //   "username": user.email.replaceAll("@gmail.com", ""),
      //   "name": user.displayName,
      //   "imageUrl": user.photoURL,
      //   // "isListner": isListener
      // };

      // DatabaseMethods()
      //     .addUserInfoToDB(user.uid, userInfoMap)
      //     .whenComplete(() => print('Added to database.'));
      // .then((context) {
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => HomePage()));
      // });
    }
    return user;
  }

  Future signOutGoogle() async {
    _auth.signOut();
    googleSignIn.signOut();
    print('sign out done');
  }
}
