import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  //final SignInWithApple _appleSignIn = SignInWithApple();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isAlreadyLogged() {
    var user = _auth.currentUser;
    print("User: ${user?.displayName}");
    return user != null;
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
  }

  Future<void> signOutFirebase() async {
    await _auth.signOut();
  }

  /*Future<void> signInWithApple() async {
    final appleAuth = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      webAuthenticationOptions: WebAuthenticationOptions(
        // TODO: Set the `clientId` and `redirectUri` arguments to the values you entered in the Apple Developer portal during the setup
        clientId: 'com.aboutyou.dart_packages.sign_in_with_apple.example',
        redirectUri: Uri.parse(
          'https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple',
        ),
      ),
      // TODO: Remove these if you have no need for them
      nonce: 'example-nonce',
      state: 'example-state',
    );

    print(appleAuth);

    // credenciales para firebase
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: appleAuth.identityToken,
      idToken: appleAuth.identityToken,
    );

    // firebase sign in

    final authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user!;
    final firebaseToken = await user.getIdToken();
    assert(!user.isAnonymous);
    assert(firebaseToken != null);
    final User currentUser = _auth.currentUser!;
    assert(user.uid == currentUser.uid);
  }*/

  Future<void> signInWithGoogle() async {
    // Google sign in
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;

    print("User: ${googleUser.displayName}");
    print("User: ${googleUser.email}");
    print("User: ${googleUser.photoUrl}");

    // credenciales para firebase
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // firebase sign in

    final authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user!;
    final firebaseToken = await user.getIdToken();
    assert(!user.isAnonymous);
    assert(firebaseToken != null);
    final User currentUser = _auth.currentUser!;
    assert(user.uid == currentUser.uid);

    print("Firebase Token:  $firebaseToken");
  }
}
