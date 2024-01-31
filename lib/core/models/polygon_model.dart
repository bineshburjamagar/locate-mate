class PolygonModel {
  final List<GeocodedWaypoint> geocodedWaypoints;
  final List<Route> routes;
  final String status;

  PolygonModel({
    required this.geocodedWaypoints,
    required this.routes,
    required this.status,
  });

  factory PolygonModel.fromJson(Map<String, dynamic> json) => PolygonModel(
        geocodedWaypoints: List<GeocodedWaypoint>.from(
            json["geocoded_waypoints"]
                .map((x) => GeocodedWaypoint.fromJson(x))),
        routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "geocoded_waypoints":
            List<dynamic>.from(geocodedWaypoints.map((x) => x.toJson())),
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
        "status": status,
      };
}

class GeocodedWaypoint {
  final String geocoderStatus;
  final String placeId;
  final List<String> types;

  GeocodedWaypoint({
    required this.geocoderStatus,
    required this.placeId,
    required this.types,
  });

  factory GeocodedWaypoint.fromJson(Map<String, dynamic> json) =>
      GeocodedWaypoint(
        geocoderStatus: json["geocoder_status"],
        placeId: json["place_id"],
        types: List<String>.from(json["types"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "geocoder_status": geocoderStatus,
        "place_id": placeId,
        "types": List<dynamic>.from(types.map((x) => x)),
      };
}

class Route {
  final Bounds bounds;
  final String copyrights;
  final List<Leg> legs;
  final Polyline overviewPolyline;
  final String summary;
  final List<dynamic> warnings;
  final List<dynamic> waypointOrder;

  Route({
    required this.bounds,
    required this.copyrights,
    required this.legs,
    required this.overviewPolyline,
    required this.summary,
    required this.warnings,
    required this.waypointOrder,
  });

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        bounds: Bounds.fromJson(json["bounds"]),
        copyrights: json["copyrights"],
        legs: List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
        overviewPolyline: Polyline.fromJson(json["overview_polyline"]),
        summary: json["summary"],
        warnings: List<dynamic>.from(json["warnings"].map((x) => x)),
        waypointOrder: List<dynamic>.from(json["waypoint_order"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "bounds": bounds.toJson(),
        "copyrights": copyrights,
        "legs": List<dynamic>.from(legs.map((x) => x.toJson())),
        "overview_polyline": overviewPolyline.toJson(),
        "summary": summary,
        "warnings": List<dynamic>.from(warnings.map((x) => x)),
        "waypoint_order": List<dynamic>.from(waypointOrder.map((x) => x)),
      };
}

class Bounds {
  final Northeast northeast;
  final Northeast southwest;

  Bounds({
    required this.northeast,
    required this.southwest,
  });

  factory Bounds.fromJson(Map<String, dynamic> json) => Bounds(
        northeast: Northeast.fromJson(json["northeast"]),
        southwest: Northeast.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast.toJson(),
        "southwest": southwest.toJson(),
      };
}

class Northeast {
  final double lat;
  final double lng;

  Northeast({
    required this.lat,
    required this.lng,
  });

  factory Northeast.fromJson(Map<String, dynamic> json) => Northeast(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Leg {
  final Distance distance;
  final Distance duration;
  final String endAddress;
  final Northeast endLocation;
  final String startAddress;
  final Northeast startLocation;
  final List<Step> steps;
  final List<dynamic> trafficSpeedEntry;
  final List<dynamic> viaWaypoint;

  Leg({
    required this.distance,
    required this.duration,
    required this.endAddress,
    required this.endLocation,
    required this.startAddress,
    required this.startLocation,
    required this.steps,
    required this.trafficSpeedEntry,
    required this.viaWaypoint,
  });

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        distance: Distance.fromJson(json["distance"]),
        duration: Distance.fromJson(json["duration"]),
        endAddress: json["end_address"],
        endLocation: Northeast.fromJson(json["end_location"]),
        startAddress: json["start_address"],
        startLocation: Northeast.fromJson(json["start_location"]),
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        trafficSpeedEntry:
            List<dynamic>.from(json["traffic_speed_entry"].map((x) => x)),
        viaWaypoint: List<dynamic>.from(json["via_waypoint"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "distance": distance.toJson(),
        "duration": duration.toJson(),
        "end_address": endAddress,
        "end_location": endLocation.toJson(),
        "start_address": startAddress,
        "start_location": startLocation.toJson(),
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
        "traffic_speed_entry":
            List<dynamic>.from(trafficSpeedEntry.map((x) => x)),
        "via_waypoint": List<dynamic>.from(viaWaypoint.map((x) => x)),
      };
}

class Distance {
  final String text;
  final int value;

  Distance({
    required this.text,
    required this.value,
  });

  factory Distance.fromJson(Map<String, dynamic> json) => Distance(
        text: json["text"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "value": value,
      };
}

class Step {
  final Distance distance;
  final Distance duration;
  final Northeast endLocation;
  final String htmlInstructions;
  final Polyline polyline;
  final Northeast startLocation;
  final String travelMode;
  final String maneuver;

  Step({
    required this.distance,
    required this.duration,
    required this.endLocation,
    required this.htmlInstructions,
    required this.polyline,
    required this.startLocation,
    required this.travelMode,
    required this.maneuver,
  });

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        distance: Distance.fromJson(json["distance"]),
        duration: Distance.fromJson(json["duration"]),
        endLocation: Northeast.fromJson(json["end_location"]),
        htmlInstructions: json["html_instructions"],
        polyline: Polyline.fromJson(json["polyline"]),
        startLocation: Northeast.fromJson(json["start_location"]),
        travelMode: json["travel_mode"],
        maneuver: json["maneuver"],
      );

  Map<String, dynamic> toJson() => {
        "distance": distance.toJson(),
        "duration": duration.toJson(),
        "end_location": endLocation.toJson(),
        "html_instructions": htmlInstructions,
        "polyline": polyline.toJson(),
        "start_location": startLocation.toJson(),
        "travel_mode": travelMode,
        "maneuver": maneuver,
      };
}

class Polyline {
  final String points;

  Polyline({
    required this.points,
  });

  factory Polyline.fromJson(Map<String, dynamic> json) => Polyline(
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "points": points,
      };
}
