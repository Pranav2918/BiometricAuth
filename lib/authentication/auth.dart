 import 'package:local_auth/local_auth.dart';

class Authentication {

  static Future<bool> authenticateWithBiometrics() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      List<BiometricType> biometricTypes =
          await localAuthentication.getAvailableBiometrics();

      print("Biometric Type => $biometricTypes");

      isAuthenticated = await localAuthentication.authenticate(

        localizedReason: 'Please Authenticate Yourself',
        options: const AuthenticationOptions(biometricOnly: true),
      );
    }

    return isAuthenticated;
  }
  
 }