import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:real_estate_app/common/constants/dimensions.dart';
import 'package:real_estate_app/common/skin/colors.dart';
import '../../widgets/features/map/map_fab.dart';
import '../../widgets/features/map/map_dialog.dart';
import 'package:latlong2/latlong.dart';
import '../../widgets/features/map/search_field.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key, this.darkMapStyle});
  final String? darkMapStyle;

  @override
  State<MapScreen> createState() => MapSampleState();
}

class MapSampleState extends State<MapScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isExpanded = true;


  final MapController _mapController = MapController();

  final List<LatLng> _locations = [
    LatLng(59.9343, 30.3351),
    LatLng(59.9398, 30.3006),
    LatLng(59.9339, 30.3061),
    LatLng(59.9339, 30.3171),
    LatLng(59.9250, 30.2958),
    LatLng(59.9250, 30.3171),
    LatLng(59.9127, 30.3010),
    LatLng(59.9400, 30.3208),
  ];

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: 700.ms, reverseDuration: 500.ms);
    _animationController.addStatusListener((listener) {
      if (listener == AnimationStatus.dismissed) {
        _expand();
      } else {
        _retract();
      }
    });
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _expand();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _expand() {
    setState(() {
      _isExpanded = false;
    });
  }

  void _retract() {
    setState(() {
      _isExpanded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: LatLng(59.9339, 30.3061), // Saint Petersburg coordinates
              initialZoom: 14.0,
              minZoom: 4.0,
              maxZoom: 28.0,
              backgroundColor: Colors.black,
            ),
            children: [
              TileLayer(
                maxZoom: double.infinity,
                retinaMode: true,
                urlTemplate: 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png',
                subdomains: const ['a', 'b', 'c', 'd'],
                userAgentPackageName: 'com.example.realEstateApp',
              ),
              MarkerLayer(
                markers: _locations.map((point) => Marker(
                    width: 300.0,
                    height: 40.0,
                    point: point,
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Align(
                          alignment: Alignment.bottomLeft,
                          child: Transform.scale(
                            scale: _animation.value + (_isExpanded ? 0 : 1),
                            alignment: Alignment.bottomLeft,
                            child: AnimatedContainer(
                              duration: 800.ms,
                              width: !_isExpanded ? 40 : 100,
                              padding: EdgeInsets.symmetric(horizontal: !_isExpanded ? 8 : 12, vertical: 12),
                              decoration: BoxDecoration(
                                  color: context.colorScheme.primary,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  )),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                 Icon(Icons.business, size: 14, color: AppColors.white,),
                                  _isExpanded ? Flexible(
                                    child: AutoSizeText(
                                      '10,3 mn ₽',
                                      style: context.textTheme.bodySmall?.copyWith(
                                        fontSize: 10,
                                        color: context.colorScheme.surface,
                                      ),
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                    ),
                                  ) : SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ),
                )
                    .toList(),
              ),
            ],
          ),
          MapFab(),
          Positioned(
            left: 30,
            bottom: context.sizeHeight(0.11),
            child: MapDialog(
              animationController: _animationController,
            ),
          ),
          SearchFieldWidget(),
        ],
      ),
    );
  }
}
