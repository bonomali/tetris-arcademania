#include <iostream>
using std::cout;
using std::endl;

#include "exception.h"

/*************************************************************************************************
* Purpose: Default constructor to instantiate Exeption object with default message
*
* Precondition: instantiate Exception object without a specified message
*
* Postcondition: Exception object created with default message
***************************************************************************************************/
Exception::Exception() : m_msg(nullptr)
{
	char* general = "Unknown Error";	//default error message

	m_msg = new char[strlen(general) + 1];
	strcpy(m_msg, general);
}
/*************************************************************************************************
* Purpose: Constructor to instantiate an Exception object with a specified error message
*
* Precondition: instantiate Exception object with specified message
*
* Postcondition: Exception object created with specified error message
***************************************************************************************************/
Exception::Exception(char* msg) : m_msg(nullptr)
{
	if (msg != nullptr)
	{
		m_msg = new char[strlen(msg) + 1];
		strcpy(m_msg, msg);
	}
}
/*************************************************************************************************
* Purpose: Copy Constructor
*
* Precondition: create copy of Exception object
*
* Postcondition: copy of Exception object created
***************************************************************************************************/
Exception::Exception(const Exception &copy) : m_msg(nullptr)
{
	*this = copy;
}
/*************************************************************************************************
* Purpose: Overloaded operator= constructor
*
* Precondition: assign an Exception object to another Exception object or when copy constructor is called
*
* Postcondition: Exception object assigned the value of another Exception object or copy of Exception
* object created
***************************************************************************************************/
Exception& Exception::operator=(const Exception &rhs)
{
	if (this != &rhs)
	{
		delete [] m_msg;	//delete old message and return to default value
		m_msg = nullptr; 

		if (rhs.m_msg != nullptr)	//if rhs.m_msg not nullptr, assign rhs to this
		{
			m_msg = new char[strlen(rhs.m_msg) + 1];
			strcpy(m_msg, rhs.m_msg);
		}
	}

	return *this;
}
/*************************************************************************************************
* Purpose: Destructor to release dynamically allocated space
*
* Precondition: Exception object destroyed or falls out of scope
*
* Postcondition: Exeption object destroyed and returned to default values
***************************************************************************************************/
Exception::~Exception()
{
	delete [] m_msg;	//delete Exception object and return to default value
	m_msg = nullptr;
}
/*************************************************************************************************
* Purpose: Return error message
*
* Precondition: none
*
* Postcondition: error message returned
***************************************************************************************************/
const char* Exception::getMessage()
{
	return m_msg;
}
/*************************************************************************************************
* Purpose: Set error message
*
* Precondition: pass in characters 
*
* Postcondition: old error message deleted and assigned new value
***************************************************************************************************/
void Exception::setMessage(char* msg)
{
	delete[] m_msg;		//delete old error message and return to default value
	m_msg = nullptr;

	m_msg = new char[strlen(msg) + 1];	//assign passed in error message to m_msg
	strcpy(m_msg, msg);
}
/*************************************************************************************************
* Purpose: Overloaded Output Operator
*
* Precondition: pass in output stream and Exception object to be outputted
*
* Postcondition: overload output operator to output error message
***************************************************************************************************/
ostream& operator << (ostream &stream, const Exception &except)
{
	return stream << except.m_msg;
}