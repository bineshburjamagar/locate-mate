class MateModel {
  final int id;
  final String fullName;
  final String image;
  final double lat;
  final double lang;
  final String address;

  MateModel({
    required this.id,
    required this.fullName,
    required this.image,
    required this.lat,
    required this.lang,
    required this.address,
  });
}

List<MateModel> mateList = [
  MateModel(
    id: 1,
    fullName: 'Nitesh Neupane',
    image:
        'https://images.unsplash.com/photo-1503443207922-dff7d543fd0e?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    lat: 27.7069002,
    lang: 85.3423878,
    address: 'Naxal Bhagawati Temple',
  ),
  MateModel(
    id: 2,
    fullName: 'Rupesh Chaulagain',
    image:
        'https://images.unsplash.com/photo-1492288991661-058aa541ff43?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    lat: 27.6954749,
    lang: 85.3548451,
    address: 'Airport Road 09, Kathmandu 44600',
  ),
];
