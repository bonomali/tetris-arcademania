#include "scoreboard.h"

ScoreBoard::ScoreBoard()
{
    m_highScores[0].name = "Stephanie";
    m_highScores[0].score = 100000000;

    m_highScores[1].name = "Issac";
    m_highScores[1].score = 99000000;

    m_highScores[2].name = "Joshie";
    m_highScores[2].score = 5000000;
}
void ScoreBoard::writeToFile()
{
    ofstream file("high_scores.txt");

    if (file.is_open())
    {
        for(int i = 0; i < NUM_HSCORES; i++)
        {
            file << m_highScores[i].name << endl;
            file << m_highScores[i].score << endl;
        }
    }
    else cout << "File didn't open" << endl;

    file.close();		//close file
}
void ScoreBoard::readFromFile()
{
    string line;

    ifstream file("high_scores.txt");

    if(file.is_open())
    {
        while(getline (file,line))
        {
            cout << line << endl;
        }
        file.close();
    }
    else
        cout << "Unable to open file" << endl;
}
int ScoreBoard::checkHighScore(int newScore)
{
    int newHScoreIndex = -1;

    for(int i = 0; i < NUM_HSCORES; i++)
    {
        if(newScore > m_highScores[i].score)
        {
            m_highScores[i].score = newScore;
            newHScoreIndex = i;
        }
    }
    return newHScoreIndex;
}
void ScoreBoard::setName(QString newName, int index)
{
    m_highScores[index].name = newName.toStdString();
}
QString ScoreBoard::getName(int index)
{
    return QString::fromStdString(m_highScores[(index - 1)].name);
}
int ScoreBoard::getScore(int index)
{
    return m_highScores[(index - 1)].score;
}
