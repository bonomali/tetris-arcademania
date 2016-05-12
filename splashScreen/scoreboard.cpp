#include "scoreboard.h"

ScoreBoard::ScoreBoard()
{
    m_highScores[0].name = "Stephanie";
    m_highScores[0].score = "9000";
    m_highScores[0].time = "2:04";

    m_highScores[1].name = "Issac";
    m_highScores[1].score = "8000";
    m_highScores[1].time = "1:30";

    m_highScores[2].name = "Joshie";
    m_highScores[2].score = "7000";
    m_highScores[2].time = "1:04";

    m_highScores[3].name = "Alex";
    m_highScores[3].score = "6000";
    m_highScores[3].time = "5:04";

    m_highScores[4].name = "AJ";
    m_highScores[4].score = "5000";
    m_highScores[4].time = "2:30";

    m_highScores[5].name = "Ryan";
    m_highScores[5].score = "4000";
    m_highScores[5].time = "0:56";

    m_highScores[6].name = "Holly";
    m_highScores[6].score = "3000";
    m_highScores[6].time = "1:06";

    m_highScores[7].name = "Katie";
    m_highScores[7].score = "2000";
    m_highScores[7].time = "0:38";

    m_highScores[8].name = "Patrick";
    m_highScores[8].score = "1000";
    m_highScores[8].time = "0:12";

    m_highScores[9].name = "Diego";
    m_highScores[9].score = "0";
    m_highScores[9].time = "10:59";

    m_highScores[10].name = "";
    m_highScores[10].score = "0";
    m_highScores[10].time = "0:00";

    m_highScores[11].name = "";
    m_highScores[11].score = "0";
    m_highScores[11].time = "0:00";

    m_highScores[12].name = "";
    m_highScores[12].score = "0";
    m_highScores[12].time = "0:00";

    m_highScores[13].name = "";
    m_highScores[13].score = "0";
    m_highScores[13].time = "0:0";

    m_highScores[14].name = "";
    m_highScores[14].score = "0";
    m_highScores[14].time = "0:0";

    readFromFile();
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
            for(int j = (int)m_highScores[i].name.length(); j < 11; j++)
                m_highScores[i].name += " ";

            getline(file, line);
            m_highScores[i].score = line;

            for(int j = (int)m_highScores[i].score.length(); j < 11; j++)
                m_highScores[i].score += " ";

            getline(file, line);
            m_highScores[i].time = line;
        }
        file.close();
    }
    else
    {
        cout << "Unable to open file" << endl;
        writeToFile();
        readFromFile();
    }
}
int ScoreBoard::checkHighScore(int newScore, QString newTime)
{
    int newHScoreIndex = -1;
    bool found = false;

    for(int i = 0; i < NUM_HSCORES && !found; i++)
    {
        if(newScore > stoi(m_highScores[i].score))
        {
            newHScoreIndex = i;
            found = true;
        }
    }
    if(found)
    {
        for(int i = (NUM_HSCORES - 1); i > newHScoreIndex; i--)
        {
            m_highScores[i].name = m_highScores[(i - 1)].name;
            m_highScores[i].score = m_highScores[(i - 1)].score;
            m_highScores[i].time = m_highScores[(i - 1)].time;
        }
        setScore(newScore, newHScoreIndex);
        setTime(newTime, newHScoreIndex);
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
QString ScoreBoard::getPlayerStats(int index)
{
    return QString::fromStdString(m_highScores[(index - 1)].name + m_highScores[(index - 1)].score +
            m_highScores[(index - 1)].time);
}
void ScoreBoard::setName(QString newName, int index)
{
    m_highScores[index].name = newName.toStdString();
    writeToFile();
    readFromFile();

    for(int i = 0; i < NUM_HSCORES; i++)
    {
        cout << m_highScores[i].name << " " << m_highScores[i].score << " " << m_highScores[i].time << endl;
    }
}
void ScoreBoard::setScore(int newScore, int index)
{
    m_highScores[index].score = std::to_string(newScore);
}
void ScoreBoard::setTime(QString newTime, int index)
{
    m_highScores[index].time = newTime.toStdString();
}
