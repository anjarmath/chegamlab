import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> addprofileMhs({
    required String nama,
    required String nim,
  }) async {
    String res = 'Ada error';
    try {
      if (nama.isNotEmpty || nim.isNotEmpty) {
        await _firestore
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          'nama': nama,
          'nim': nim,
        });

        res = 'success';
      } else {
        res = 'Oops! Isi semua data';
      }
    } on FirebaseAuthException catch (err) {
      return err.code;
    }
    return res;
  }

  Future<String> addprofileDsn({
    required String nama,
    required String nip,
  }) async {
    String res = 'Ada error';
    try {
      if (nama.isNotEmpty || nip.isNotEmpty) {
        await _firestore
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          'nama': nama,
          'nip': nip,
        });

        res = 'success';
      } else {
        res = 'Oops! Isi semua data';
      }
    } on FirebaseAuthException catch (err) {
      return err.code;
    }
    return res;
  }

  Future<String> signUpUser({
    required String nama,
    required String email,
    required String password,
  }) async {
    String res = 'Ada error';
    try {
      if (email.isNotEmpty || password.isNotEmpty || nama.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        await _firestore.collection('users').doc(cred.user!.uid).set({
          'nama': nama,
          'email': email,
          'password': password,
          'premium': 'no'
        });

        res = 'sukses sign up';
      } else {
        res = 'Oops! Isi semua data';
      }
    } on FirebaseAuthException catch (err) {
      return err.code;
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Ada error';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'Oops! Isi semua data';
      }
    } on FirebaseAuthException catch (err) {
      return err.code;
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String> nama() async {
    final data = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    String email;
    if (data.data() != null) {
      email = data.data()!['nama'];
    } else {
      email = 'Anonymous';
    }
    return email;
  }

  Future<int> getKelas({
    required String kelas,
  }) async {
    final data =
        await FirebaseFirestore.instance.collection('kelas').doc(kelas).get();
    int akses;
    if (data.data() != null) {
      akses = data.data()!['akses'];
    } else {
      akses = 0;
    }
    return akses;
  }
}
