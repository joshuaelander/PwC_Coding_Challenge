// Copyright (c) 2015, Joshua Elander. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:vowelfinder_v2/vowelfinder_v2.dart' as vowelfinder_v2;
import 'dart:io';
/*
 * Variables
 */
//can actually do this more consisely.
//Block of text to search through.
String blockOfText =
    "I pledge allegiance to the Flag of the United States of America,\n" +
        "and to the Republic for which it stands, one Nation under God,\n" +
        "indivisible, with liberty and justice for all, should be rendered\n" +
        "by standing at attention facing the flag with the right hand over\n" +
        "the heart. When not in uniform men should remove any non-religious\n" +
        "headdress with their right hand and hold it at the left shoulder,\n" +
        "the hand being over the heart. Persons in uniform should remain\n" +
        "silent, face the flag and render the military salute.";

var arrayOfLines = [];
var arrayOfWords = [];
var arrayOfLetters = [];
var arrayOfVowels = [
  "a",
  "e",
  "i",
  "o",
  "u",
  "A",
  "E",
  "I",
  "O",
  "U"
]; //can use case compare false if it exists
var wordCount = 0;
var lineCount = 0;
var lineMarked = false;

//Main function which runs the code.
main() {
  var currentLine = "";
  var currentWord = "";
  var vowelCount;
  var numWords = 1;
  var numVowels = 3;
  var numLines = 3;
  arrayOfLines = blockOfText.split("\n");

//take in keypad input for the number of words, vowels, and lines to search.
print("Enter the number to search every X lines: ");
String temp = stdin.readLineSync();
numLines = int.parse(temp);

print("Enter the number to search every Y words per line: ");
temp = stdin.readLineSync();
numWords = int.parse(temp);

print("Enter the number of vowels to search for in each word: ");
temp = stdin.readLineSync();
numVowels = int.parse(temp);

//itterating through the different lines in the block to text to find the 3rd line
  for (var i = 1; i <= arrayOfLines.length; i++) {
    if (((numLines * i) - 1) < arrayOfLines.length) {
      lineMarked = false;
      currentLine = arrayOfLines[numLines * i - 1];
      arrayOfWords = currentLine.split(" ");

      //itterating through the different words within the current line of text
      for (var j = 1; j <= arrayOfWords.length; j++) {
        vowelCount = 0;
        if ((numWords * j - 1) < arrayOfWords.length) {
          currentWord = arrayOfWords[numWords * j - 1];
          arrayOfLetters = currentWord.split("");

          //itterating through the different letters within the word to compare each to vowels
          for (var k = 0; k < arrayOfLetters.length; k++) {
            if (arrayOfVowels.contains(arrayOfLetters[k])) {
              vowelCount++;

              //upon finding 3 vowels increast the word and line count
              if (vowelCount == numVowels) {
                wordCount++;
                if (lineMarked == false) {
                  lineCount++;
                  lineMarked = true;
                }
              }
            }
          }
        }
      }
    }
  }
  print("Results: lines: $lineCount words: $wordCount");
}
