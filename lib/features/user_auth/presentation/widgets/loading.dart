import '../../../../app.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     const CircularProgressIndicator(color: AppColor.color4),
          //     const Text('Loading...')
          //   ],
          // ),
          SpinKitPianoWave(
        color: AppColor.color4,
        size: 50.0,
      ),
    );
  }
}
