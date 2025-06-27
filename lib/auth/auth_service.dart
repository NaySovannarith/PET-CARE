import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

ValueNotifier<AuthService> authService = ValueNotifier<AuthService>(
  AuthService(),
);

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? get currentUser => firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  // User Authentication Methods
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<UserCredential> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      print('📌 [${DateTime.now()}] Start signUp');

      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('✅ [${DateTime.now()}] Created user');

      final user = userCredential.user;
      if (user != null) {
        await Future.wait([
          user.updateProfile(displayName: username),
          firestore.collection('users').doc(user.uid).set({
            'email': email,
            'username': username,
            'createdAt': FieldValue.serverTimestamp(),
          }),
        ]);

        print('✅ [${DateTime.now()}] Finished Firestore + profile update');
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('❌ FirebaseAuthException: ${e.code} at ${DateTime.now()}');
      throw _handleAuthError(e);
    } catch (e) {
      print('❌ Unknown error: $e at ${DateTime.now()}');
      rethrow;
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  // Profile Management
  Future<void> updateProfile({
    String? displayName,
    String? phoneNumber,
    String? photoURL,
  }) async {
    try {
      await currentUser?.updateDisplayName(displayName);
      if (phoneNumber != null) {
        await currentUser?.updatePhoneNumber(
          PhoneAuthProvider.credential(
            verificationId: 'TODO', // You'll need to implement phone auth
            smsCode: 'TODO',
          ),
        );
      }
      await currentUser?.updatePhotoURL(photoURL);

      // Update Firestore document
      await firestore.collection('users').doc(currentUser?.uid).update({
        if (displayName != null) 'username': displayName,
        if (phoneNumber != null) 'phoneNumber': phoneNumber,
        if (photoURL != null) 'photoURL': photoURL,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update profile: ${e.toString()}');
    }
  }

  // Password Management
  Future<void> resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<void> resetPasswordFromCurrentPassword({
    required String email,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final credential = EmailAuthProvider.credential(
        email: email,
        password: currentPassword,
      );
      await currentUser!.reauthenticateWithCredential(credential);
      await currentUser!.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    }
  }

  // Account Management
  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    try {
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await currentUser!.reauthenticateWithCredential(credential);

      // Delete user document first
      await firestore.collection('users').doc(currentUser?.uid).delete();

      // Then delete auth account
      await currentUser!.delete();
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    }
  }

  // Pet Management Methods
  Future<void> addPet({
    required String name,
    required String breed,
    required String gender,
    required double height,
    required int age,
    required double weight,
    required String color,
    String? photoURL,
  }) async {
    try {
      final userId = currentUser?.uid;
      if (userId == null) throw Exception('User not authenticated');

      await firestore.collection('users').doc(userId).collection('pets').add({
        'name': name,
        'breed': breed,
        'gender': gender,
        'height': height,
        'age': age,
        'weight': weight,
        'color': color,
        'photoURL': photoURL,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to add pet: ${e.toString()}');
    }
  }

  Future<List<Map<String, dynamic>>> getUserPets() async {
    try {
      final userId = currentUser?.uid;
      if (userId == null) throw Exception('User not authenticated');

      final snapshot =
          await firestore
              .collection('users')
              .doc(userId)
              .collection('pets')
              .orderBy('createdAt', descending: true)
              .get();

      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception('Failed to get pets: ${e.toString()}');
    }
  }

  Future<void> updatePet({
    required String petId,
    String? name,
    String? breed,
    String? gender,
    double? height,
    int? age,
    double? weight,
    String? color,
    String? photoURL,
  }) async {
    try {
      final userId = currentUser?.uid;
      if (userId == null) throw Exception('User not authenticated');

      final updateData = <String, dynamic>{
        if (name != null) 'name': name,
        if (breed != null) 'breed': breed,
        if (gender != null) 'gender': gender,
        if (height != null) 'height': height,
        if (age != null) 'age': age,
        if (weight != null) 'weight': weight,
        if (color != null) 'color': color,
        if (photoURL != null) 'photoURL': photoURL,
        'updatedAt': FieldValue.serverTimestamp(),
      };

      await firestore
          .collection('users')
          .doc(userId)
          .collection('pets')
          .doc(petId)
          .update(updateData);
    } catch (e) {
      throw Exception('Failed to update pet: ${e.toString()}');
    }
  }

  Future<void> deletePet(String petId) async {
    try {
      final userId = currentUser?.uid;
      if (userId == null) throw Exception('User not authenticated');

      await firestore
          .collection('users')
          .doc(userId)
          .collection('pets')
          .doc(petId)
          .delete();
    } catch (e) {
      throw Exception('Failed to delete pet: ${e.toString()}');
    }
  }

  // Helper Methods
  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is malformed';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'email-already-in-use':
        return 'This email is already registered';
      case 'weak-password':
        return 'Password should be at least 6 characters';
      case 'requires-recent-login':
        return 'Please login again to perform this action';
      default:
        return 'An error occurred: ${e.message}';
    }
  }
}
