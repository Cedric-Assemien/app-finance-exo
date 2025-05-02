import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../utils/constants.dart';

class QRCodeBottomSheet extends StatelessWidget {
  const QRCodeBottomSheet({super.key});

  // Cette méthode montre le bottom sheet
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Pour permettre de prendre 90% de l'écran
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8, // 90% de l'écran
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, scrollController) => const QRCodeBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Barre supérieure avec titre et bouton de retour
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Scan QR Code',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          //   child: Row(
          //     children: [
          //       CircleAvatar(
          //         backgroundColor: Colors.white,
          //         child: IconButton(
          //           icon: const Icon(Icons.arrow_back),
          //           onPressed: () => Navigator.pop(context),
          //         ),
          //       ),
          //       const Expanded(
          //         child: Center(
          //           child: Text(
          //             'Scan QR Code',
          //             style: TextStyle(
          //               fontSize: 18,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ),
          //       ),
          //       const SizedBox(width: 48),
          //       // Espace pour équilibrer le bouton retour
          //     ],
          //   ),
          // ),

          // Conteneur principal
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // QR Code
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            QrImageView(
                              data: 'https://www.iit.ci/',
                              version: QrVersions.auto,
                              size: 310,
                              backgroundColor: Colors.white,
                            ),
                            // Logo jaune au centre du QR
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFD700), // Jaune
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.water,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                          // width: 220,
                          // height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.person, size: 18),
                              const SizedBox(width: 8),
                              Text('Devano Mahendra',
                                  style: AppStyles.bodyLarge),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Nom d'utilisateur

                  SizedBox(
                    height: 20,
                  ),
                  // Texte explicatif
                  Text(
                    'Experience fast, secure, and hassle-free transactions with FirePay. Scan QR codes and complete payments effortlessly!',
                    style:
                        AppStyles.bodyMedium.copyWith(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),

                  const Spacer(),

                  // Bouton de partage
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share, color: Colors.white),
                      label: const Text('Share Code',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Gardons l'écran QR complet pour la compatibilité, mais il utilise maintenant le bottom sheet
class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Affiche automatiquement le bottom sheet
    WidgetsBinding.instance.addPostFrameCallback((_) {
      QRCodeBottomSheet.show(context);
    });

    // Retourne un écran vide derrière le bottom sheet
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('QR Code'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Center(
        child: Text('Tap below to show QR code'),
      ),
    );
  }
}

// Fonction utilitaire pour montrer le bottom sheet de n'importe où dans l'application
void showQRCodeBottomSheet(BuildContext context) {
  QRCodeBottomSheet.show(context);
}
