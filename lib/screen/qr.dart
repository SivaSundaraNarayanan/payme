import 'package:flutter/material.dart';
import 'package:payme/data/upi.dart';
import 'package:payme/utils/generator.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPopup extends StatelessWidget {
  final UPI upi;
  final String? am;
  const QRPopup({super.key, required this.upi, this.am});

  @override
  Widget build(BuildContext context) {
    String url = generateUri(upi.id, am: am);

    return Center(
      child: Hero(
        tag: 'popup_hero',
        // createRectTween: ((begin, end) => CustomReactTween(begin, end)),
        child: Material(
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }
}
