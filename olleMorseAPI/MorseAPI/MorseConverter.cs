using System;
using System.Collections.Generic;
using System.Linq;

namespace olleMorseAPI.MorseAPI
{
    public static class MorseConverter
    {
        static char szDot = '.';
        static char szDash = '-';
        static Dictionary<char, string> strToMorseArr = new Dictionary<char, String>()
        {
            {'a', string.Concat(szDot, szDash)},
            {'b', string.Concat(szDash, szDot, szDot, szDot)},
            {'c', string.Concat(szDash, szDot, szDash, szDot)},
            {'d', string.Concat(szDash, szDot, szDot)},
            {'e', szDot.ToString()},
            {'f', string.Concat(szDot, szDot, szDash, szDot)},
            {'g', string.Concat(szDash, szDash, szDot)},
            {'h', string.Concat(szDot, szDot, szDot, szDot)},
            {'i', string.Concat(szDot, szDot)},
            {'j', string.Concat(szDot, szDash, szDash, szDash)},
            {'k', string.Concat(szDash, szDot, szDash)},
            {'l', string.Concat(szDot, szDash, szDot, szDot)},
            {'m', string.Concat(szDash, szDash)},
            {'n', string.Concat(szDash, szDot)},
            {'o', string.Concat(szDash, szDash, szDash)},
            {'p', string.Concat(szDot, szDash, szDash, szDot)},
            {'q', string.Concat(szDash, szDash, szDot, szDash)},
            {'r', string.Concat(szDot, szDash, szDot)},
            {'s', string.Concat(szDot, szDot, szDot)},
            {'t', string.Concat(szDash)},
            {'u', string.Concat(szDot, szDot, szDash)},
            {'v', string.Concat(szDot, szDot, szDot, szDash)},
            {'w', string.Concat(szDot, szDash, szDash)},
            {'x', string.Concat(szDash, szDot, szDot, szDash)},
            {'y', string.Concat(szDash, szDot, szDash, szDash)},
            {'z', string.Concat(szDash, szDash, szDot, szDot)},
            {'0', string.Concat(szDash, szDash, szDash, szDash, szDash)},
            {'1', string.Concat(szDot, szDash, szDash, szDash, szDash)},
            {'2', string.Concat(szDot, szDot, szDash, szDash, szDash)},
            {'3', string.Concat(szDot, szDot, szDot, szDash, szDash)},
            {'4', string.Concat(szDot, szDot, szDot, szDot, szDash)},
            {'5', string.Concat(szDot, szDot, szDot, szDot, szDot)},
            {'6', string.Concat(szDash, szDot, szDot, szDot, szDot)},
            {'7', string.Concat(szDash, szDash, szDot, szDot, szDot)},
            {'8', string.Concat(szDash, szDash, szDash, szDot, szDot)},
            {'9', string.Concat(szDash, szDash, szDash, szDash, szDot)}
        };
        static Dictionary<char, String> morseToStrArr = new Dictionary<char, String>()
        {
          {'A' , ".-"},
          {'B' , "-..."},
          {'C' , "-.-."},
          {'D' , "-.."},
          {'E' , "."},
          {'F' , "..-."},
          {'G' , "--."},
          {'H' , "...."},
          {'I' , ".."},
          {'J' , ".---"},
          {'K' , "-.-"},
          {'L' , ".-.."},
          {'M' , "--"},
          {'N' , "-."},
          {'O' , "---"},
          {'P' , ".--."},
          {'Q' , "--.-"},
          {'R' , ".-."},
          {'S' , "..."},
          {'T' , "-"},
          {'U' , "..-"},
          {'V' , "...-"},
          {'W' , ".--"},
          {'X' , "-..-"},
          {'Y' , "-.--"},
          {'Z' , "--.."},
          {'0' , "-----"},
          {'1' , ".----"},
          {'2' , "..---"},
          {'3' , "...--"},
          {'4' , "....-"},
          {'5' , "....."},
          {'6' , "-...."},
          {'7' , "--..."},
          {'8' , "---.."},
          {'9' , "----."},
          {' ' , "/"},
        };
        public static string DecodeMorse(string morseCode)
        {
            string[] morseCodeWords = morseCode.Split('|'); //This is only for convert string to string array. The string not possible to contain | symbol.

            string outputStr = "";

            foreach (string morseWord in morseCodeWords)
            {
                string[] morseLetters = morseWord.Split(' ');
                string outputWord = "";

                foreach (string morseLetter in morseLetters)
                    outputWord += morseToStrArr.FirstOrDefault(x => x.Value == morseLetter).Key;

                outputStr += (outputStr == "") ? outputWord : " " + outputWord;
            }

            return outputStr;
        }

        public static string EncodeMorse(string input)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            string newStr = input.ToLower();
            foreach (char character in newStr)
            {
                if (strToMorseArr.ContainsKey(character))
                    sb.Append(strToMorseArr[character] + " ");
                else if (character == ' ')
                    sb.Append(" / ");
                else
                    sb.Append(character + " ");
            }
            return sb.ToString();
        }


        public static string DecodeJsonData(string morseCode)
        {
            string[] morseCodeWords = morseCode.Split('"'); //This is only for convert string to string array. The string not possible to contain | symbol.
            string outputStr = "";

            
            foreach (string morseWord in morseCodeWords)
            {
                string[] morseLetters = morseWord.Split(' ');
                string outputWord = "";

                foreach (string morseLetter in morseLetters)
                {
                    if (!morseToStrArr.ContainsValue(morseLetter)){
                        outputWord += morseLetter;
                        continue;
                    }
                        
                    outputWord += morseToStrArr.FirstOrDefault(x => x.Value == morseLetter).Key;
                }
                    

                outputStr +=outputWord;
            }

            return outputStr;
        }


    }
}