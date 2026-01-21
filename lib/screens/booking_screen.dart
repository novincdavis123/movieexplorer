import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class BookingScreen extends StatelessWidget {
  final String movieTitle;
  final String movieDate;
  final String movieTime;
  final String movieRow;
  final String seatNumber;
  final String movieImage;

  const BookingScreen({
    super.key,
    required this.movieTitle,
    required this.movieDate,
    required this.movieTime,
    required this.movieRow,
    required this.seatNumber,
    required this.movieImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Booking Confirmation"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),

            // Tick Icon - Top aligned
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 8),
            Text(
              "Booking Successful!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            const SizedBox(height: 16),

            // Ticket Card with cutouts
            Center(
              child: ClipPath(
                clipper: TicketClipper(),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Movie image with title
                      SizedBox(
                        height: 180,
                        child: Stack(
                          children: [
                            ClipPath(
                              clipper: TicketClipper(),
                              child: Image.asset(
                                movieImage,
                                width: double.infinity,
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 12,
                              left: 16,
                              child: Text(
                                movieTitle,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 6,
                                      color: Colors.black54,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),
                      const Divider(color: Colors.grey),

                      // Date | Time | Row | Seat
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildInfoItem("Date", movieDate),
                                _buildInfoItem("Time", movieTime),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildInfoItem("Row", movieRow),
                                _buildInfoItem("Seat", seatNumber),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Barcode
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: BarcodeWidget(
                          barcode: Barcode.code128(),
                          data: "$movieTitle|$movieDate|$movieTime|$seatNumber",
                          width: double.infinity,
                          height: 70,
                          drawText: false,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// Custom clipper for ticket shape with visible cutouts
class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double cutRadius = 16;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height / 2 - cutRadius);
    path.arcToPoint(
      Offset(0, size.height / 2 + cutRadius),
      radius: Radius.circular(cutRadius),
      clockwise: false,
    );
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 2 + cutRadius);
    path.arcToPoint(
      Offset(size.width, size.height / 2 - cutRadius),
      radius: Radius.circular(cutRadius),
      clockwise: false,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
