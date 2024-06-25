import '../../../../app.dart';

class SignUpProfileScreen extends StatelessWidget {
  const SignUpProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Center(
                child: Text("Profile"),
              ),
              SizedBox(height: 20),
              Form(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          expands: false,
                          decoration: InputDecoration(
                              labelText: "First Name",
                              prefixIcon: Icon(Icons.person)),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          expands: false,
                          decoration: InputDecoration(
                              labelText: "Last Name",
                              prefixIcon: Icon(Icons.person)),
                        ),
                      ),
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
