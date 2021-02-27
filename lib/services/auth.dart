import 'package:google_sign_in/google_sign_in.dart';
import 'package:yao_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import 'package:yao_app/services/database.dart';
// import 'package:rxdart/rxdart.dart';

// Woosignal import
import 'package:wp_json_api/enums/wp_auth_type.dart';
import 'package:wp_json_api/models/responses/wp_user_info_response.dart';
import 'package:wp_json_api/models/responses/wp_user_login_response.dart';
import 'package:wp_json_api/models/responses/wp_user_register_response.dart';
import 'package:wp_json_api/wp_json_api.dart';

// Woocommerce
import 'package:woocommerce/woocommerce.dart';
// import 'package:woocommerce/models/wc_membership.dart';
// import 'package:woocommerce/models/wc_membership_name.dart';

/// Storage
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:date_format/date_format.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final WPJsonAPI _wpSignIn = WPJsonAPI.instance;
  final _storage = FlutterSecureStorage();

  // final Firestore _db = Firestore.instance;

  // PublishSubject loading = PublishSubject();
  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, isVerified: user.isEmailVerified) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  WooCommerce woocommerce = WooCommerce(
      baseUrl: 'https://yaonology.com',
      consumerKey: 'ck_26745646efdd34642c7638cdf61e33b568d4dfa2',
      consumerSecret: 'cs_5e1c4ec821afbf3e4f13f5272a84d5288b655658');

  // wp login by woosignal
  Future signInWithWPJsonAPI(String email, String password) async {
    /// Connect to Firebase
    // Use WP user credentials to sign in the App
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;

    /// UserLogin and get userToken
    WPUserLoginResponse wpUserLoginResponse = await _wpSignIn.api((request) {
      return request.wpLogin(
          email: email, password: password, authType: WPAuthType.WpEmail);
    });
    if (wpUserLoginResponse != null) {
      await storeCustomerSignIn(wpUserLoginResponse, email, password);
    }
    return [user];
  }

  //woosignal and firebase create an account
  Future registerBothAccounts(
      String username, String email, String password) async {
    WPUserRegisterResponse wpUserRegisterResponse =
        await WPJsonAPI.instance.api((request) {
      return request.wpRegister(
          email: email, password: password, username: username);
    });
    if (wpUserRegisterResponse != null) {
      await storeCustomerSignUp(wpUserRegisterResponse, email, password);

      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await user.sendEmailVerification();
      _auth.signOut();
    }
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user;
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // create a new document for the user with the uid
      //     .updateUserData('0', 'new crew member', 100);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign in with google account
  Future googleSignIn() async {
    try {
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // FirebaseUser user = await _auth.signInWithCredential(credential);
      AuthResult result = await _auth.signInWithCredential(credential);
      // WPUserLoginResponse wpUserLoginResponse = await _wpSignIn.api((request) {
      //   return request.wpLogin(
      //       email: result.user.email,
      //       password: result.user,
      //       authType: WPAuthType.WpEmail);
      // });
      // if (wpUserLoginResponse != null) {
      //   await storeCustomerSignIn(wpUserLoginResponse, email, password);
      // }

      // await storeCustomerSignUp(googleAuth.accessToken, credential, credential);

      FirebaseUser user = result.user;
      print('signed in ' + user.displayName);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //

  Future sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return "success";
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //

  void updateUserData(FirebaseUser user) async {}

  // sign out
  Future signOut() async {
    _deleteAll();
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  void _deleteAll() async {
    await _storage.deleteAll();
  }

  Future storeCustomerSignIn(wpUserLoginResponse, email, password) async {
    // Use userToken to Get WP userId
    WPUserInfoResponse wpUserInfoResponse =
        await WPJsonAPI.instance.api((request) {
      return request.wpGetUserInfo(wpUserLoginResponse.data.userToken);
    });

    /// Login - Signs a user in and returns the logged in user's (WooUser object) details.
    final wooMembership = await woocommerce.loginMembership(
        userId: wpUserInfoResponse.data.id, email: email, password: password);

    /// list of product names
    List<String> listProduct = List<String>();
    Map mapProdcut = Map();
    // int indBasic;
    for (var i = 0; i < wooMembership.length; i++) {
      var membershipDetail = await woocommerce.getMembershipName(
          planId: wooMembership[i]['plan_id']);

      mapProdcut[membershipDetail.name] = wooMembership[i]["status"];
      listProduct.add(membershipDetail.name);

      // listStatus.add(wooMembership[i]["status"]);
      // final membershipDetail = await woocommerce.getMembershipName(
      //     planId: wooMembership[i]['plan_id']);

    }

    /// store customer info in flutter_storage_secure
    var custID = wpUserInfoResponse.data.id;
    var custUsername = wpUserInfoResponse.data.firstName +
        " " +
        wpUserInfoResponse.data.lastName;
    await _storage.write(key: "currentCustomer", value: custID.toString());
    if (custUsername == " ") {
      custUsername = wpUserInfoResponse.data.username;
      await _storage.write(
          key: custID.toString() + "userName", value: custUsername);
    } else {
      await _storage.write(
          key: custID.toString() + "userName", value: custUsername);
    }

    String custProduct;

    if (wooMembership.length != 0) {
      if (mapProdcut.length == 1 &&
          mapProdcut.containsKey('Basic Membership')) {
        custProduct = 'Basic Membership';
        var custStatus = mapProdcut['Basic Membership'];
        await _storage.write(
            key: custID.toString() + "product", value: custProduct);

        await _storage.write(
            key: custID.toString() + "status", value: custStatus);

        /// extract membership detail info
        WooMember membership;
        int ind = listProduct.indexOf('Basic Membership'); // -1
        // int ind = listMembershipName.indexOf('Basic Membership'); // -1
        membership = WooMember.fromJson(wooMembership[ind]);
        var custStartDate = convertDateFromString(membership.startDate);
        var custCancelDate = convertDateFromString(membership.cancelledDate);

        await _storage.write(
            key: custID.toString() + "startDate",
            value: custStartDate.toString());

        await _storage.write(
            key: custID.toString() + "cancelDate",
            value: custCancelDate.toString());

        // Premium
      } else if (mapProdcut.containsKey('Premium Membership') &&
          (mapProdcut['Premium Membership'] == 'active' ||
              mapProdcut['Premium Membership'] == 'free_trial')) {
        custProduct = 'Premium Membership';
        var custStatus = mapProdcut['Premium Membership'];
        await _storage.write(
            key: custID.toString() + "product", value: custProduct);

        await _storage.write(
            key: custID.toString() + "status", value: custStatus);

        /// extract membership detail info
        WooMember membership;
        int ind = listProduct.indexOf('Premium Membership'); // -1
        // int ind = listMembershipName.indexOf('Basic Membership'); // -1
        membership = WooMember.fromJson(wooMembership[ind]);
        var custStartDate = convertDateFromString(membership.startDate);
        // var customerEndDate = basicMembership.endDate;
        var custCancelDate = convertDateFromString(membership.cancelledDate);
        await _storage.write(
            key: custID.toString() + "startDate",
            value: custStartDate.toString());

        await _storage.write(
            key: custID.toString() + "cancelDate",
            value: custCancelDate.toString());

        // SPY
      } else if (mapProdcut.containsKey('SPY Membership') &&
          (mapProdcut['SPY Membership'] == 'active' ||
              mapProdcut['SPY Membership'] == 'free_trial')) {
        custProduct = 'SPY Membership';
        var custStatus = mapProdcut['SPY Membership'];
        await _storage.write(
            key: custID.toString() + "product", value: custProduct);

        await _storage.write(
            key: custID.toString() + "status", value: custStatus);

        /// extract membership detail info
        WooMember membership;
        int ind = listProduct.indexOf('SPY Membership'); // -1
        // int ind = listMembershipName.indexOf('Basic Membership'); // -1
        membership = WooMember.fromJson(wooMembership[ind]);

        var custStartDate = convertDateFromString(membership.startDate);
        var custCancelDate = convertDateFromString(membership.cancelledDate);

        // var custStartDate = membership.startDate;
        // // var customerEndDate = basicMembership.endDate;
        // var custCancelDate = membership.cancelledDate;
        await _storage.write(
            key: custID.toString() + "startDate",
            value: custStartDate.toString());

        await _storage.write(
            key: custID.toString() + "cancelDate",
            value: custCancelDate.toString());

        // Bitcoin
      } else if (mapProdcut.containsKey('Bitcoin Membership') &&
          (mapProdcut['Bitcoin Membership'] == 'active' ||
              mapProdcut['Bitcoin Membership'] == 'free_trial')) {
        custProduct = 'Bitcoin Membership';
        var custStatus = mapProdcut['Bitcoin Membership'];
        await _storage.write(
            key: custID.toString() + "product", value: custProduct);

        await _storage.write(
            key: custID.toString() + "status", value: custStatus);

        /// extract membership detail info
        WooMember membership;
        int ind = listProduct.indexOf('Bitcoin Membership'); // -1
        // int ind = listMembershipName.indexOf('Basic Membership'); // -1
        membership = WooMember.fromJson(wooMembership[ind]);
        var custStartDate = convertDateFromString(membership.startDate);
        // var customerEndDate = basicMembership.endDate;
        var custCancelDate = convertDateFromString(membership.cancelledDate);
        await _storage.write(
            key: custID.toString() + "startDate",
            value: custStartDate.toString());

        await _storage.write(
            key: custID.toString() + "cancelDate",
            value: custCancelDate.toString());
      } else {
        print('Please check customer\'s membership');
      }
    }
  }

  Future storeCustomerSignUp(wpUserRegisterResponse, email, password) async {
    // Use userToken to Get WP userId
    WPUserInfoResponse wpUserInfoResponse =
        await WPJsonAPI.instance.api((request) {
      return request.wpGetUserInfo(wpUserRegisterResponse.data.userToken);
    });

    /// store customer info in flutter_storage_secure
    var custID = wpUserInfoResponse.data.id;
    var custUsername = wpUserInfoResponse.data.username;
    await _storage.write(key: "currentCustomer", value: custID.toString());
    await _storage.write(
        key: custID.toString() + "userName", value: custUsername);
    return null;
  }

  Future getSecureInfo(String dataKey) async {
    var currentID = await _storage.read(key: "currentCustomer");
    if (currentID == null) {
      return null;
    } else {
      var data = await _storage.read(key: currentID + dataKey);
      if (data == null) {
        print("$dataKey has no information");
        return null;
      } else {
        print("$dataKey = $data");
        return data;
      }
    }
  }

  void rewriteMembership(String dataKey, value) async {
    var currentID = await _storage.read(key: "currentCustomer");
    await _storage.write(key: currentID + dataKey, value: value);
  }

  convertDateFromString(String strDate) {
    if (strDate != null && strDate != "") {
      DateTime date = DateTime.parse(strDate);
      // print(date);
      // print(formatDate(date, [yyyy, '-', mm, '-', dd]));
      return formatDate(date, [yyyy, '-', mm, '-', dd]);
    } else {
      return strDate;
    }
  }
}
