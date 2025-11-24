// import 'dart:async';

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:cloth_ecommerce/core/theming/colors.dart';
// import 'package:cloth_ecommerce/core/widgets/finding_button.dart';

// class GoogleMapWidget extends StatefulWidget {
//   const GoogleMapWidget({
//     super.key,
//     this.currentLocation,
//     required this.markers,
//     required this.onTap,
//     required this.onMapCreated,
//     required this.isUsePinForLocation,
//     required this.confirmMarker,
//   });
//   final LatLng? currentLocation;
//   final Set<Marker> markers;
//   final Function(LatLng) onTap;
//   final Function(GoogleMapController) onMapCreated;
//   final bool isUsePinForLocation;
//   static const LatLng _defaultLocation = LatLng(30.0444, 31.2357);
//   static const double _defaultZoom = 12.0;
//   final Function(LatLng, String) confirmMarker;
//   @override
//   State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
// }

// class _GoogleMapWidgetState extends State<GoogleMapWidget> {
//   LatLng? centerLocation;
//   final StreamController<LatLng?> _centerLocationController = StreamController<LatLng?>.broadcast();
//   Stream<LatLng?> get centerLocationStream => _centerLocationController.stream;

//   @override
//   void dispose() {
//     _centerLocationController.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: centerLocationStream,
//         builder: (context, centerLocationSnapshot) {
//           return Stack(
//             children: [
//               GoogleMap(
//                 initialCameraPosition: CameraPosition(
//                   target: widget.currentLocation ?? GoogleMapWidget._defaultLocation,
//                   zoom: GoogleMapWidget._defaultZoom,
//                 ),
//                 onMapCreated: widget.onMapCreated,
//                 markers: widget.markers,
//                 myLocationEnabled: false,
//                 myLocationButtonEnabled: false,
//                 mapToolbarEnabled: false,
//                 zoomControlsEnabled: false,
//                 onTap: widget.onTap,
//                 onCameraMove: (CameraPosition position) {
//                   centerLocation = position.target;
//                   _centerLocationController.add(centerLocation);
//                 },
//               ),
//               if (widget.isUsePinForLocation)
//                 Align(
//                   alignment: Alignment.center,
//                   child: Container(
//                     margin: EdgeInsets.only(bottom: 35),
//                     child: Icon(
//                       Icons.location_pin,
//                       size: 40,
//                       color: AppColors.purpleColor,
//                     ),
//                   ),
//                 ),
//               if (widget.isUsePinForLocation)
//                 Positioned(
//                   bottom: 0,
//                   left: 20,
//                   right: 20,
//                   child: SafeArea(
//                     minimum: EdgeInsets.only(bottom: 20),
//                     child: FindingButton(
//                       disabled: false,
//                       onPressed: centerLocationSnapshot.data != null
//                           ? () => widget.confirmMarker(
//                                 centerLocationSnapshot.data!,
//                                 "location",
//                               )
//                           : () {},
//                       text: "Confirm Location".tr(),
//                     ),
//                   ),
//                 ),
//             ],
//           );
//         });
//   }
// }
