import 'package:flutter/material.dart';
import 'package:payme/data/upi.dart';
import 'package:payme/design/color.dart';
import 'package:payme/screen/qr.dart';
import 'package:payme/screen/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  late String _upi;
  List<UPI> availableUPIs = [
    UPI(id: '9840954063@paytm', title: 'Paytm'),
    UPI(id: 'sivasundaranarayanan@oksbi', title: 'G Pay'),
  ];

  @override
  void initState() {
    super.initState();
    _upi = availableUPIs[0].id;
  }

  @override
  Widget build(BuildContext context) {
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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => SettingsScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Receving Money to ${getUPIName()}',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              const Text(
                'Enter Amount',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "0.0",
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 64.0,
                    color: Colors.white.withAlpha(125),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(
                  fontSize: 64.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Receive to',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                    ...availableUPIs
                        .map(
                          (upi) => RadioListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 8.0),
                            dense: true,
                            title: Text(
                              upi.title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                            subtitle: Text(upi.id),
                            value: upi.id,
                            groupValue: _upi,
                            onChanged: (id) {
                              setState(() {
                                _upi = id!;
                              });
                            },
                          ),
                        )
                        .toList(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryYellow,
                        ),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return QRScreen(
                                  upi: availableUPIs.firstWhere(
                                    (element) => element.id == _upi,
                                    orElse: () => availableUPIs.first,
                                  ),
                                  am: controller.text,
                                );
                              },
                            ),
                          );
                        },
                        child: const Text('Show QR'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getUPIName() {
    UPI upi = availableUPIs.firstWhere((element) => element.id == _upi);
    return upi.title;
  }
}
