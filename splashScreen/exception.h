/***************************************************************************************
* Class: Exception
*
* Purpose: This class creates error messages for exception handeling. The error messages
* are output to the console screen for the user using the overloaded output operator.
*
* Manager Functions:
*						Exception()
*							default ctor creates a general error message
*						Exception(char* msg)
*							creates an error message from passed in value
*						Exception(const Exception<T> &copy)
*						Exception<T>& operator=(const Exception<T> & rhs)
*						~Exception()
*
* Methods:				const char* getMessage()							
*							returns error message
*						void setMessage(char* msg)
*							setter to set error message
*						friend ostream& operator<<(ostream &stream, const Exception &except)
*							overloaded output operator to output error message
*****************************************************************************************/
#ifndef EXCEPTION_H
#define EXCEPTION_H

using std::ostream;

class Exception
{
public:
	Exception();										//default ctor
	Exception(char* msg);								//one-arg ctor
	Exception(const Exception &copy);					//copy ctor
	Exception& operator=(const Exception &rhs);			//op= ctor
	~Exception();										//dtor
	const char* getMessage();							//msg getter
	void setMessage(char* msg);							//msg setter
	friend ostream& operator<<(ostream &stream, const Exception &except);	//overload output

private:
	char* m_msg;	//error msg
};
#endif