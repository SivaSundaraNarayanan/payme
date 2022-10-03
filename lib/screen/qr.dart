import 'package:flutter/material.dart';
import 'package:payme/data/upi.dart';
import 'package:payme/design/color.dart';
import 'package:payme/utils/generator.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatelessWidget {
  final UPI upi;
  final String? am;
  const QRScreen({super.key, required this.upi, this.am});

  @override
  Widget build(BuildContext context) {
    String url = generateUri(upi.id, am: am);

    print(url);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            secondaryBlue,
            primaryBlue,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.chevron_left_outlined),
            onPressed: Navigator.of(context).pop,
          ),
        ),
        body: Center(
          heightFactor: 2,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 4.0,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                QrImage(
                  size: 172,
                  padding: const EdgeInsets.all(8.0),
                  data: url,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                Text(
                  upi.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
