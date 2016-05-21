/***************************************************************************************
* Class: ScoreBoard
*
* Purpose: This class is the scoreboard for Tetris. The high scores are written to a
* text file.
*
* Manager Functions:   ScoreBoard()
*                           defalut ctor initializes array of high scores and
*                           reads high scores from text file (creates file if one
*                           doesn't exist)
*
* Methods:     void setScore(int newScore, int index)
*                   sets score associated with new high score
*              void setTime(QString newTime, int index)
*                   sets time associated with new high score
*
* slots:       void writeToFile()
*                   write highscore array to file
*              void readFromFile()
*                   read high scores from file into highscore array
*              int checkHighScore(int newScore, QString newTime)
*                   checks for new high score by comparing newscore to
*                   already exisiting high scores
*              void setName(QString newName, int index)
*                   sets name associated with new high score
*              QString getName(int index)
*                   returns name from high scores array
*              QString getScore(int index)
*                   returns score from high scores array
*              QString getTime(int index)
*                   returns time from high scores array
*              QString getPlayerStats(int index)
*                   returns Qstring of player's high score stats
*****************************************************************************************/
#ifndef SCOREBOARD_H
#define SCOREBOARD_H

#include <QObject>

#include <iostream>
using std::cout;
using std::endl;

#include <fstream>
using std::ofstream;
using std::ifstream;

#include <string>
using std::string;

const int NUM_HSCORES = 15; //number of high scores in array

//information stored for each player in array
struct high_scores {
    string name;
    string score;
    string time;
};

class ScoreBoard : public QObject
{
    Q_OBJECT

public:
    ScoreBoard();                               //default ctor
    void setScore(int newScore, int index);     //set high score
    void setTime(QString newTime, int index);   //set time

public slots:
    void writeToFile();                         //write array to textfile
    void readFromFile();                        //read scores from textfile into array
    int checkHighScore(int newScore, QString newTime);  //check for new high score
    void setName(QString newName, int index);   //set player's name
    QString getName(int index);                 //set player's score
    QString getScore(int index);                //return player's score
    QString getTime(int index);                 //return player's time
    QString getPlayerStats(int index);          //return Qstring of player's stats

private:
    high_scores m_highScores[NUM_HSCORES];      //array of player high scores
};

#endif // SCOREBOARD_H
