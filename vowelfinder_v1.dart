// Copyright (c) 2015, Joshua Elander. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/*
 * Imports
 */
import 'package:vowelfinder/vowelfinder.dart' as vowelfinder;

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
  var vowelCount;
  arrayOfLines = blockOfText.split("\n");
  
  //itterating through the different lines in the block to text to find the 3rd line
  for (var i = 1; i < arrayOfLines.length; i++) {
    if (((3 * i) - 1) < arrayOfLines.length) {
      lineMarked = false;
      currentLine = arrayOfLines[3 * i - 1];
      arrayOfWords = currentLine.split(" ");
      
      //itterating through the different words within the current line of text
      for (var j = 0; j < arrayOfWords.length; j++) {
        vowelCount = 0;
        arrayOfLetters = arrayOfWords[j].split("");
        
        //itterating through the different letters within the word to compare each to vowels
        for (var k = 0; k < arrayOfLetters.length; k++) {
          if (arrayOfVowels.contains(arrayOfLetters[k])) {
            vowelCount++;
            
            //upon finding 3 vowels increast the word and line count
            if (vowelCount == 3) {
              wordCount++;
              if(lineMarked == false){
                lineCount++;
                lineMarked = true;
              }
            }
          }
        }
      }
    }
  }
  print("Results: lines: $lineCount words: $wordCount");
}
