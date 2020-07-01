import 'dart:io';
import 'dart:convert';
import 'package:dart_space_adventure/dart_space_adventure.dart';


void main(List<String> arguments) { 
  final jsonMap = getJson(arguments[0]);
  final systemName = jsonMap['name'];
  final planetData = getPlanetData(jsonMap);
  SpaceAdventure(
    planetarySystem: PlanetarySystem(
      name: systemName, 
      planets: mockPlanets(planetData)
    )
  ).start();
}

List<Planet> mockPlanets(Map<dynamic, dynamic> planetData) {
  return planetData.entries.map( 
    (e) => Planet(name: e.key, description: e.value)
  ).toList();
}

Map<String, dynamic> getJson(String arg) {
  var jsondata = File(arg).readAsStringSync();
  Map<String, dynamic> jsonMap = json.decode(jsondata);
  return jsonMap;
}

Map<dynamic, dynamic> getPlanetData(Map<String, dynamic> jsonMap) {
  final planetData = {};
  for(var e in jsonMap['planets']) {
    planetData[e['name']] = e['description'];
  }
  return planetData;
}



//const systemName = 'Solar system';
// const planetData =
// {
//   'Mercury': 'A very hot planet, closest to the sun.',
//   'Venus': 'It is cloudy and insanely hot here.',
//   'Earth': 'There is something very familiar about this planet.',
//   'Mars': 'Known as the red planet.',
//   'Jupiter': 'A gas giant with a noticeable red spot.',
//   'Saturn': 'This planet has beautiful rings around it.',
//   'Uranus': 'Strangely, this planet rotates around on it\'s side.',
//   'Neptune': 'A very cold planet, furthest from the sun.',
//   'Pluto': 'I don\'t care what they say, it\'s a planet.'
// };