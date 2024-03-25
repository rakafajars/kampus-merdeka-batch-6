import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BelajarCachedNetowrkImage extends StatelessWidget {
  const BelajarCachedNetowrkImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: double.infinity,
          color: Colors.red,
          child: CachedNetworkImage(
            imageUrl:
                'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
            placeholder: (context, url) => const CircularProgressIndicator(),
            // ketika url nya error,maka munculkan errorWidget
            errorWidget: (context, url, error) {
              return const Icon(
                Icons.image_not_supported_rounded,
                size: 42,
              );
            },
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
