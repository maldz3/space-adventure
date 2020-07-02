import 'dart:io';
import 'package:dart_space_adventure/dart_space_adventure.dart';
import 'planetary_system.dart';
import 'planet.dart';

class SpaceAdventure {

  final PlanetarySystem planetarySystem;

  SpaceAdventure({this.planetarySystem});

  void start() {
    printGreeting();
    printIntro(getInput('What is your name?'));
    print('Let\'s go on an adventure!');
    if (planetarySystem.hasPlanets) {
      travel(
        travelChoice('Shall I randomly choose a planet for you to visit? (Y or N)'));
    } else {
      print('Aw there are no planets to explore.');
    }
  }

  void printGreeting() {
    print(
      'Welcome to the ${planetarySystem.name}!\n'
      'There are ${planetarySystem.numberOfPlanets} planets to explore.'
    );
  }

  void printIntro(String name) {
    print('Nice to meet you, $name.  My name is Maliha, I\'m an old friend of Alexa.');
  }

  String getInput(String prompt) {
    print(prompt);
    return stdin.readLineSync();
  }

  void travelTo(Planet planet) {
    print('Travelling to ${planet.name}...');
    print('Arrived at ${planet.name}. ${planet.description}');
  }

  void travel(bool randomDestination) {

    Planet planet;
    if (randomDestination) {
      planet = planetarySystem.randomPlanet();
    } else {
      planet = planetarySystem.planetWithName(
        getInput('Name the planet you would like to visit.'));
    }
    travelTo(planet);
  }

  bool travelChoice(String prompt) {
    String answer;

    while(answer != 'Y' && answer != 'N') {
      answer = getInput(prompt);
      if (answer == 'Y') {
        return true;
      } else if (answer == 'N') {
        return false;
      } else {
        print('Sorry I didn\'t get that.');
      }
    }
    return false;
  }

}

