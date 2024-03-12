import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Future<void> _register() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Registration successful, you can navigate to another screen if needed
      // For now, let's print a success message
      print('Registration successful');
    } catch (e) {
      // Handle registration errors
      print('Registration failed: $e');
      // You can also show an error message to the user using a snackbar or dialog
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Registration failed. Please try again.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.blueGrey, // Change the background color here
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/regbackground.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.3, // Adjust this value as needed
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.white, // Background color for the frame container
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        children: [
                          TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              isDense: true,
                            ),
                          ),
                          SizedBox(height: 12.0),
                          TextField(
                            controller: _phoneNumberController,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              isDense: true, 
                            ),
                          ),
                          SizedBox(height: 12.0),
                          TextField(
                            controller: _dobController,
                            decoration: InputDecoration(
                              labelText: 'Date of Birth',
                              isDense: true,
                            ),
                          ),
                          SizedBox(height: 12.0),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              isDense: true,
                            ),
                          ),
                          SizedBox(height: 12.0),
                          TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              isDense: true,
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 12.0),
                          TextField(
                            controller: _stateController,
                            decoration: InputDecoration(
                              labelText: 'State',
                              isDense: true,
                            ),
                          ),
                          SizedBox(height: 12.0),
                          TextField(
                            controller: _cityController,
                            decoration: InputDecoration(
                              labelText: 'City',
                              isDense: true,
                            ),
                          ),
                          SizedBox(height: 12.0),
                          TextField(
                            controller: _pincodeController,
                            decoration: InputDecoration(
                              labelText: 'Pincode',
                              isDense: true,
                            ),
                          ),
                          SizedBox(height: 12.0),
                          TextField(
                            controller: _addressController,
                            decoration: InputDecoration(
                              labelText: 'Address',
                              isDense: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _register,
                      child: Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
