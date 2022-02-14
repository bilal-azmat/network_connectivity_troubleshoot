This Package is useful in case the internet is not available. A bottom sheet pops up
with the image and text that app is not connected with internet. A button
is also available to try again.


## Getting Started

In your flutter project add the dependency:

```yml
dependencies:
  ...
  network_connectivity_troubleshoot:
```
For help getting started with Flutter, view the online
[documentation](https://flutter.io/).

## Usage example



import 'package:network_connectivity_troubleshoot.dart'

```dart
import 'package:network_connectivity_troubleshoot/network_connectivity_troubleshoot.dart';
```
To make this to work in your project add this `addPostFrameCallback()` in build method of
your class before your return widget tree.

```dart
  @override
  Widget build(BuildContext context) {
  WidgetsBinding.instance!.addPostFrameCallback(
        (_) => CheckInternetConnectivity().checkInternetAndProceed(
              context,
              title: "No Internet",
              buttonText: "Try Again!",
            ));

            ....

      }
```


`Note`: You can customize the design of bottom sheet by giving properties in checkInternetAndProceed method
of this package.

