import 'dart:ffi';

class Dinosaur{
	String commonName, scientificName, era, 
    dietType, description, placeOfDiscovery, imageURL;
  Float weight, height;
	
	Dinosaur({
		required this.commonName,
    required this.scientificName,
		required this.era,
		required this.dietType,
    required this.description,
    required this.placeOfDiscovery,
		required this.imageURL,
    required this.weight,
    required this.height,
  });
}