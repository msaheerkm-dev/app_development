import 'package:flutter/material.dart';

class TempSignup extends StatefulWidget {
  const TempSignup({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<TempSignup> {
  // Form key and text editing controllers for managing form state
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Print form values (replace this with form submission logic)
      print('Username: ${_usernameController.text}');
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Create your account',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black54),
                ),
                const SizedBox(height: 32),

                // Form Fields
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildInputField('Username', Icons.person, _usernameController),
                      _buildInputField('Email', Icons.email, _emailController, isEmail: true),
                      _buildInputField('Password', Icons.lock, _passwordController, isPassword: true),
                      _buildInputField('Confirm Password', Icons.lock, _confirmPasswordController,
                          isPassword: true),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // Sign up Button
                SizedBox(
                  width: MediaQuery.of(context).size.width/1.5,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                      style: const ButtonStyle(
                        backgroundColor:
                        WidgetStatePropertyAll(Colors.teal),
                      ),
                    child: const Text('Sign up',style: TextStyle(color: Colors.white),),
                  ),
                ),

                const SizedBox(height: 16),

                const Text('or', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),

                const SizedBox(height: 16),

                // Sign in with Google Button
                OutlinedButton.icon(
                  onPressed: () {
                    print('Sign in with Google');
                  },
                  icon: const Icon(Icons.account_circle, color: Colors.white),
                  label: const Text('Sign in with Google',style: TextStyle(color: Colors.white),),
                  style: const ButtonStyle(
                    backgroundColor:
                    WidgetStatePropertyAll(Colors.black),
                  ),
                ),

                const SizedBox(height: 32),

                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? ', style: TextStyle(color: Colors.black)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login'); // Example route
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.cyan[700], fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build input fields
  Widget _buildInputField(String label, IconData icon, TextEditingController controller,
      {bool isPassword = false, bool isEmail = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return 'Enter a valid email';
          }
          if (isPassword && value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        },
      ),
    );
  }
}
