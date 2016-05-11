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

const int NUM_HSCORES = 3;
struct high_scores {
    string name;
    int score;
};

class ScoreBoard : public QObject
{
    Q_OBJECT

public:
    ScoreBoard();

public slots:
    void writeToFile();
    void readFromFile();
    int checkHighScore(int newScore);
    void setName(QString newName, int index);
    QString getName(int index);
    int getScore(int index);

private:
    high_scores m_highScores[3];
};

#endif // SCOREBOARD_H
