class HotelModel {
  late String label;
  late double longitude;
  late String region;
  late String destType;
  late String cc1;
  late String type;
  late String imageUrl;
  late String timezone;
  late int hotels;
  late String country;
  late int rtl;
  late String destId;
  late String name;
  late String lc;
  late String cityName;
  late int cityUfi;
  late int nrHotels;
  late double latitude;

  HotelModel({
    required this.label,
    required this.longitude,
    required this.region,
    required this.destType,
    required this.cc1,
    required this.type,
    required this.imageUrl,
    required this.timezone,
    required this.hotels,
    required this.country,
    required this.rtl,
    required this.destId,
    required this.name,
    required this.lc,
    required this.cityName,
    required this.cityUfi,
    required this.nrHotels,
    required this.latitude,
  });

   HotelModel.fromJson(Map<String, dynamic> json) {
     label= json['label'];
     longitude= json['longitude'].toDouble();
     region= json['region'];
     destType= json['dest_type'];
     cc1= json['cc1'];
     type= json['type'];
     imageUrl= json['image_url'];
     timezone= json['timezone'];
     hotels= json['hotels'];
     country= json['country'];
     rtl= json['rtl'];
     destId= json['dest_id'];
     name= json['name'];
     lc= json['lc'];
     cityName= json['city_name'];
     cityUfi= json['city_ufi'];
     nrHotels= json['nr_hotels'];
     latitude= json['latitude'].toDouble();
  }
}

