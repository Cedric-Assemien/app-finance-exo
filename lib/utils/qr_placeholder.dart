import 'package:flutter/material.dart';

/// Widget d'espace réservé simple pour le logo QR
class QRLogoPlaceholder extends StatelessWidget {
  final double size;
  
  const QRLogoPlaceholder({
    super.key,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0xFFFFD700), // Jaune
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.water, // Icône qui ressemble au logo dans l'image
        color: Colors.black,
        size: size * 0.6,
      ),
    );
  }
}