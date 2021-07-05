import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  Future<bool> requestPermission(Permission permission) async {
    bool isAllowed = false;
    await permission.status.then((permission_status) async {
      if (permission_status != PermissionStatus.granted) {
        await permission.request().isGranted.then((isGranted) {
          if (isGranted) {
            isAllowed = true;
          }
        });
      } else {
        isAllowed = true;
      }
    });
    return isAllowed;
  }

  /// Requests the users permission to read their location when the app is in use
  void requestLocationPermission(
      {Function? onPermissionDenied, Function? onPermissionGranted}) async {
    var grantedLocation = await requestPermission(Permission.location);
    if (!grantedLocation) {
      onPermissionDenied!();
    } else {
      onPermissionGranted!();
    }
  }

  /// Requests the users permission to use Camera.
  void requestCameraPermission(
      {Function? onPermissionDenied, Function? onPermissionGranted}) async {
    var granted = await requestPermission(Permission.camera);
    if (!granted) {
      onPermissionDenied!();
    } else {
      onPermissionGranted!();
    }
    //return granted;
  }

  /// Requests the users permission to use Read Write Storage.
  void requestStoragePermission(
      {Function? onPermissionDenied, Function? onPermissionGranted}) async {
    var granted = await requestPermission(Permission.storage);
    if (!granted) {
      onPermissionDenied!();
    } else {
      onPermissionGranted!();
    }
    //return granted;
  }

  /// Requests the users permission to use Read Write Storage.
  void requestPhotoPermission(
      {Function? onPermissionDenied, Function? onPermissionGranted}) async {
    var granted = await requestPermission(Permission.photos);
    if (!granted) {
      onPermissionDenied!();
    } else {
      onPermissionGranted!();
    }
    //return granted;
  }
}
