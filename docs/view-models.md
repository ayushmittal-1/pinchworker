# View Models

The models are used to contact the data through database to the app and maintain integrity in data. The view models acts as a supplier of the same data to the views or the screens. Here we use functions to communicate the data between views and datbase with the help of providers. We also use shared prefrences to store some of the data locally. Every view model contaning data from datbase is under the repo folder, while the one intercating wiht screen is under the view_model folder. The view models take data with the help of providers under the providers folder in lib. Every Screen has a view model breifly covered here:

## Onboarding

```dart
Future<UserModel?> getUserById(String uid) async {
    var user = await _firebaseFirestore.collection('users').doc(uid).get();

    UserModel userMod = UserModel(
      uid: user['uid'],
      email: user['email'],
      name: user['name'],
    );

    return userMod;
  }

  Future<UserModel?> _userFromFirebase({required auth.User? user}) async {
    if (user == null) {
      return null;
    }
    UserModel? userMod = await getUserById(user.uid);

    return userMod;
  }

  Future<UserModel?> signInWithEmailAndPassword({
    String? email,
    String? password,
  }) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );

    if (!credential.user!.emailVerified) {
      signOut();
      throw FirebaseAuthException(code: 'unverified-email');
    }

    return _userFromFirebase(user: credential.user);
  }

  Future<UserModel?> createUserWithEmailAndPassword({
    String? name,
    String? email,
    String? password,
  }) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    // credential.user!.sendEmailVerification();

    return UserModel(
      uid: credential.user!.uid,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    store.delete(key: 'uid');
    store.delete(key: 'loggedIn');
  }
```

The repo for a user directly interacts with the firebase auth functionality defining functions at a datbase level.

```dart
setEmail(String value) {
    _email = value;
  }

  setPassword(String value) {
    _password = value;
  }

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _passwordVisible = false;

  bool get passwordVisible => _passwordVisible;

  void toggleVisible() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  void clearValues() {
    _email = "";
    _password = "";
  }

  Future<void> postDetailsToFirestore(UserModel userModel) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection("users")
        .doc(userModel.uid)
        .set(userModel.toJson());
  }

  Future<void> loginApi(BuildContext context) async {
    Map data = {
      'email': _email.trim(),
      'password': _password.trim(),
    };

    setLoading(true);

    try {
      var value = await myRepo.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      userProvider.updateUserInfo(value!);

      setLoading(false);

      await Navigator.of(NavigationService.navigatorKey.currentContext!,
              rootNavigator: true)
          .pushAndRemoveUntil(
              Routes.testing(), (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          errorText = "Your email address appears to be malformed";
          break;
        case "wrong-password":
          errorText = "Your password is wrong";
          break;
        case "user-not-found":
          errorText = "User with this email doesn't exist";
          break;
        case "user-disabled":
          errorText = "User with this email has been disabled";
          break;
        case "too-many-requests":
          errorText = "Too many requests";
          break;
        case "operation-not-allowed":
          errorText = "Signing in with Email and Password is not enabled";
          break;
        case "quota-exceeded":
          errorText = "Quota Exceeded. Please contact Team Zine.";
          break;
        case "timeout":
          errorText = "Timeout. Please check you internet and try again later";
          break;
        case "unverified-email":
          errorText = "Please verify your email and login";
          break;
        default:
          errorText = "An undefined Error happened";
          print(e.code);
      }
      setLoading(false);

      Fluttertoast.showToast(
          msg: errorText,
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.red);
    }
  }
```

While the view model on the other hand provides logic as a whole for the view or user level abstraction.

Similarly all the other view models can be understood wiht the above example. All repo provide functionality at a database side while the view models provide the functionality of the screen side or the view side.
