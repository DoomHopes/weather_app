import 'package:hive/hive.dart';
part 'api_model.g.dart';

@HiveType(typeId: 0)
class ApiModel {
  ApiModel({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.hourly,
    this.daily,
  });
  @HiveField(0)
  double lat;
  @HiveField(1)
  double lon;
  @HiveField(2)
  String timezone;
  @HiveField(3)
  int timezoneOffset;
  @HiveField(4)
  List<Current> hourly;
  @HiveField(5)
  List<Daily> daily;

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        hourly:
            List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "hourly": List<dynamic>.from(hourly.map((x) => x.toJson())),
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 2)
class Current {
  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.weather,
    this.pop,
    this.rain,
  });

  @HiveField(0)
  DateTime dt;
  @HiveField(2)
  int sunrise;
  @HiveField(3)
  int sunset;
  @HiveField(4)
  double temp;
  @HiveField(5)
  double feelsLike;
  @HiveField(6)
  int pressure;
  @HiveField(7)
  int humidity;
  @HiveField(8)
  double dewPoint;
  @HiveField(9)
  double uvi;
  @HiveField(10)
  int clouds;
  @HiveField(11)
  int visibility;
  @HiveField(12)
  double windSpeed;
  @HiveField(13)
  int windDeg;
  @HiveField(14)
  List<Weather> weather;
  @HiveField(15)
  double pop;
  @HiveField(16)
  Rain rain;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: DateTime.fromMillisecondsSinceEpoch(json["dt"] * 1000).toLocal(),
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        uvi: json["uvi"].toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        pop: json["pop"] == null ? null : json["pop"].toDouble(),
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "pop": pop == null ? null : pop,
        "rain": rain == null ? null : rain.toJson(),
      };
}

@HiveType(typeId: 3)
class Rain {
  Rain({
    this.the1H,
  });
  @HiveField(0)
  double the1H;

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "1h": the1H,
      };
}

@HiveType(typeId: 4)
class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });
  @HiveField(0)
  int id;
  @HiveField(1)
  String main;
  @HiveField(2)
  String description;
  @HiveField(3)
  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

@HiveType(typeId: 5)
class Daily {
  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.weather,
    this.clouds,
    this.pop,
    this.rain,
    this.uvi,
  });

  @HiveField(0)
  DateTime dt;
  @HiveField(1)
  DateTime sunrise;
  @HiveField(2)
  DateTime sunset;
  @HiveField(3)
  Temp temp;
  @HiveField(4)
  FeelsLike feelsLike;
  @HiveField(5)
  int pressure;
  @HiveField(6)
  int humidity;
  @HiveField(7)
  double dewPoint;
  @HiveField(8)
  double windSpeed;
  @HiveField(9)
  int windDeg;
  @HiveField(10)
  List<Weather> weather;
  @HiveField(11)
  int clouds;
  @HiveField(12)
  double pop;
  @HiveField(13)
  double rain;
  @HiveField(14)
  double uvi;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: DateTime.fromMillisecondsSinceEpoch(json["dt"] * 1000).toLocal(),
        sunrise: DateTime.fromMillisecondsSinceEpoch(json["sunrise"] * 1000)
            .toLocal(),
        sunset: DateTime.fromMillisecondsSinceEpoch(json["sunset"] * 1000)
            .toLocal(),
        temp: Temp.fromJson(json["temp"]),
        feelsLike: FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json["clouds"],
        pop: json["pop"].toDouble(),
        rain: json["rain"] == null ? null : json["rain"].toDouble(),
        uvi: json["uvi"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp.toJson(),
        "feels_like": feelsLike.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds,
        "pop": pop,
        "rain": rain == null ? null : rain,
        "uvi": uvi,
      };
}

@HiveType(typeId: 6)
class FeelsLike {
  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  @HiveField(0)
  double day;
  @HiveField(1)
  double night;
  @HiveField(2)
  double eve;
  @HiveField(3)
  double morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

@HiveType(typeId: 7)
class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  @HiveField(0)
  double day;
  @HiveField(1)
  double min;
  @HiveField(2)
  double max;
  @HiveField(3)
  double night;
  @HiveField(4)
  double eve;
  @HiveField(5)
  double morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}
