#include "scoreboard.h"

ScoreBoard::ScoreBoard()
{
    m_highScores[0].name = "Stephanie";
    m_highScores[0].score = "100000000";
    m_highScores[0].time = "2:04";

    m_highScores[1].name = "Issac";
    m_highScores[1].score = "99000000";
    m_highScores[1].time = "1:30";

    m_highScores[2].name = "Joshie";
    m_highScores[2].score = "5000000";
    m_highScores[2].time = "1:04";
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
            file << m_highScores[i].time << endl;
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
        for(int i = 0; i < NUM_HSCORES; i++)
        {
            getline(file, line);
            m_highScores[i].name = line;
            for(int j = m_highScores[i].name.length(); j < 10; j++)
                m_highScores[j].name += " ";

            getline(file, line);
            m_highScores[i].score = line;
            getline(file, line);
            m_highScores[i].time = line;
        }
        file.close();
    }
    else
        cout << "Unable to open file" << endl;
}
int ScoreBoard::checkHighScore(int newScore, QString newTime)
{
    int newHScoreIndex = -1;

    for(int i = 0; i < NUM_HSCORES; i++)
    {
        if(newScore > stoi(m_highScores[i].score))
        {
            setScore(newScore, i);
            setTime(newTime, i);
            newHScoreIndex = i;
        }
    }
    return newHScoreIndex;
}
QString ScoreBoard::getName(int index)
{
    return QString::fromStdString(m_highScores[(index - 1)].name);
}
QString ScoreBoard::getScore(int index)
{
    return QString::fromStdString(m_highScores[(index - 1)].score);
}
QString ScoreBoard::getTime(int index)
{
    return QString::fromStdString(m_highScores[(index - 1)].time);
}
void ScoreBoard::setName(QString newName, int index)
{
    m_highScores[index].name = newName.toStdString();
}
void ScoreBoard::setScore(int newScore, int index)
{
    string score = std::to_string(newScore);
    for(int i = 0; i < 10; i++)
        if(i > score.length())
            m_highScores[index].score += " ";
        else
            m_highScores[index].score += score[i];
}
void ScoreBoard::setTime(QString newTime, int index)
{
    string time = newTime.toStdString();
    for(int i = 0; i < 6; i++)
        if(i > time.length())
            m_highScores[index].time += " ";
        else
            m_highScores[index].time += time[i];
}
