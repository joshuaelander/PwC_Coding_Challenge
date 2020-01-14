using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class GuitarAndBass
    {
        static void Main(string[] args)
        {
            StringedInstr guitar = new StringedInstr(6, 2);
            StringedInstr bass = new StringedInstr(4, 3);

            //Take in string and fret positions to compare notes
            Console.WriteLine("Enter the guitar string position: ");
            int guitarStringPos = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter the guitar fret position: ");
            int guitarFretPos = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter the bass string position: ");
            int bassStringPos = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter the bass fret position: ");
            int bassFretPos = Convert.ToInt32(Console.ReadLine());
            
            // try catch statement to make sure that the inputs don't go out of bounds
            try
            {
                if (guitar.getNote(guitarStringPos, guitarFretPos) == bass.getNote(bassStringPos, bassFretPos))
                {
                    Console.WriteLine("The notes played are the same!");
                }
                else
                {
                    Console.WriteLine("The notes are different.");
                }
            }
            catch(Exception e)
            {
                Console.WriteLine("Invalid string or fret position entered.");
            }
            
        }
    }

    //base stringinstr class, need to be extended by guitar and bass for the notes?
    class StringedInstr 
    {
        private double stdStringFreqRatio = (4.01/3);
        private double stdFretFreqRatio = 1.06;
        private int baseFreq = 82;
        private int numberOfStrings;
        private int numberOfFretboards;
        private double[,] noteAt;

        //abstract string[,] noteAt = new string[6,3] {{"E", "F", "F#"}, {"B", "C", "C#"}, {"G", "Ab", "A"}, {"D","Eb", "E"}, {"A","Bb", "B"}, {"E","F", "F#"}};
        

        //Constructor to set the number of strings and fretboards
        public StringedInstr(int guitarStrings, int fretBoards) 
        {
            NumberOfStrings = guitarStrings;
            NumberOfFretboards = fretBoards;
            noteAt = new double[NumberOfStrings, NumberOfFretboards];
            for(int i = 0; i < fretBoards; i++)
            {
                for (var j = 0; j < guitarStrings; j++) 
                {
                        //finds the note frequency for each string and fretboard and adds them to the 2D array
                        noteAt[((guitarStrings - j) - 1), i] = ((baseFreq * (Math.Pow(stdFretFreqRatio, i))) * (Math.Pow(stdStringFreqRatio, j)));
                     
                }

            } 
        }
        

        //Get & set number of strings on the instrument
        public int NumberOfStrings
        { 
            get{return numberOfStrings;}
            set{numberOfStrings = value;}
        }

        //Get & set number of fretboards on the instrument
        public int NumberOfFretboards
        {
            get { return numberOfFretboards; }
            set { numberOfFretboards = value; }
        }


        public double getNote(int stringNumber, int fretNumber)
        {
            return noteAt[stringNumber - 1, fretNumber - 1];
        }

    
    }
}
