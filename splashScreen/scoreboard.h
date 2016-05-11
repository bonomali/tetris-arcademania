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

const int NUM_HSCORES = 10;
struct high_scores {
    string name;
    string score;
    string time;
};

class ScoreBoard : public QObject
{
    Q_OBJECT

public:
    ScoreBoard();
    void setScore(int newScore, int index);
    void setTime(QString newTime, int index);

public slots:
    void writeToFile();
    void readFromFile();
    int checkHighScore(int newScore, QString newTime);
    void setName(QString newName, int index);
    QString getName(int index);
    QString getScore(int index);
    QString getTime(int index);
    QString getPlayerStats(int index);

private:
    high_scores m_highScores[NUM_HSCORES];
};

#endif // SCOREBOARD_H
