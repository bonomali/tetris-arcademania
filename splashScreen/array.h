/***************************************************************************************
* Class: Array
*
* Purpose: This class dynamically creates a templated, one-dimensional array. The array 
*          may start at any base and be any positive length or have a length of 0.
*
* Manager Functions: 	
*						Array()
*							default ctor initializes array pointer to null pointer,
*							initial array length to 0, and starting index to 0
*						Array(int length, int start_index = 0)
*						instantiates array with specified length and a starting
*							index of 0, if a starting index isn't specified
*						Array(const Array<T> &copy)
*						Array<T>& operator=(const Array<T> & rhs)
*						~Array()
*
* Methods:				T& operator[](int index) const				
*							overloaded []
*						int getStartIndex()						
*							returns the start index value
*						void setStartIndex(int start_index)		
*							setter to set the starting index
*						int getLength()
*							returns the length of the array
*						void setLength(int length)					
*							setter to set the length of the array
*****************************************************************************************/
#ifndef ARRAY_H
#define ARRAY_H

template <typename T>
class Array
{
public:
	Array();									//default ctor
	Array(int length, int start_index = 0);		//two-arg ctor
	Array(const Array<T> &copy);				//copy ctor
	Array<T>& operator=(const Array<T> &rhs);	//op= ctor
	~Array();									//dtor
	T& operator[](int index) const;				//overload []
	int getStartIndex();						//index getter
	void setStartIndex(int start_index);		//index setter
	int getLength();							//length getter
	void setLength(int length);					//length setter

private:
	T* m_array;			//pointer to array
	int m_length;		//size/length of array
	int m_start_index;	//starting index of array (base)
};

/*************************************************************************************************
* Purpose: Default constructor to instantiate Array object with default values
*
* Precondition: instantiate Array object without specified values
*
* Postcondition: Array object created with default values
***************************************************************************************************/
template <typename T>
Array<T>::Array() : m_array(nullptr), m_length(0), m_start_index(0)
{
	//cout << "single array default ctor" << endl;
}
/*************************************************************************************************
* Purpose: Constructor to instantiate an object with a specified length. Starting index may also
* be specified, but will default to 0 if not specified.
*
* Precondition: instantiate Array object with specified length and possibly, a starting index
* specified length of array must be 0 or greater or exception will be thrown
*
* Postcondition: Array object created with specified length and starting index specified or default, 0
***************************************************************************************************/
template<typename T>
Array<T>::Array(int length, int start_index) : m_array(nullptr), m_length(length), m_start_index(start_index)
{
	if (length < 0)	
		throw Exception("Error! Length must be greater than 0");	//error message for invalid length

	m_array = new T[m_length];

	//cout << "single array three-arg ctor" << endl;
}
/*************************************************************************************************
* Purpose: Copy Constructor
*
* Precondition: create copy of Array object
*
* Postcondition: copy of Array object created
***************************************************************************************************/
template <typename T>
Array<T>::Array(const Array<T> &copy) : m_array(nullptr), m_length(0), m_start_index(0)
{
	*this = copy;
	
	//cout << "single array copy ctor" << endl;
}
/*************************************************************************************************
* Purpose: Overloaded operator= constructor
*
* Precondition: assign an Array object to another Array object or when copy constructor is called
*
* Postcondition: Array object assigned the value of another Array object or copy of Array object created
***************************************************************************************************/
template <typename T>
Array<T>& Array<T>::operator=(const Array<T> &rhs)
{
	if (this != &rhs)
	{
		delete[] m_array;	//delete m_array and return to default values
		m_array = nullptr;
		m_start_index = 0;
		m_length = 0;

		if (rhs.m_array != nullptr)	//if rhs.m_array is not null, assign rhs to "this"
		{
			m_length = rhs.m_length;
			m_array = new T[m_length];
			
			for (int i = 0; i < m_length; i++)	//for all values in array
			{
				m_array[i] = rhs.m_array[i];
			}

			m_start_index = rhs.m_start_index;
		}
	}

	//cout << "single array op= ctor" << endl;
	return *this;
}
/*************************************************************************************************
* Purpose: Destructor to release dynamically allocated space
*
* Precondition: Array object destroyed or falls out of scope
*
* Postcondition: Array object destroyed and returned to default values
***************************************************************************************************/
template <typename T>
Array<T>::~Array()
{
	delete[] m_array;	//delete m_array and return to default values
	m_array = nullptr;

	m_length = 0;
	m_start_index = 0;

	//cout << "single array dtor" << endl;
}
/*************************************************************************************************
* Purpose: Overloaded operator[] to located correct index in array for all starting indexes
*
* Precondition: index must be within array bounds
*
* Postcondition: return value at specified index or throw exception if the index is not within
* the bounds of the array
***************************************************************************************************/
template <typename T>
T& Array<T>::operator[](int index) const
{
	index = index - m_start_index;	//adjust index to correct value

	if (index >= m_length || index < 0)	//check for in bounds index
        throw ("Error! Index out of array bounds");	//error message for out of bounds index


	return m_array[index];
}
/*************************************************************************************************
* Purpose: Return value of start index
*
* Precondition: none
*
* Postcondition: return value of start index
***************************************************************************************************/
template <typename T>
int Array<T>::getStartIndex()
{
	return m_start_index;
}
/*************************************************************************************************
* Purpose: Set start index
*
* Precondition: pass in value for start index
*
* Postcondition: Array will have start index specified
***************************************************************************************************/
template <typename T>
void Array<T>::setStartIndex(int start_index)
{
	m_start_index = start_index;
}
/*************************************************************************************************
* Purpose: Return length of the Array
*
* Precondition: none
*
* Postcondition: length of array returned
***************************************************************************************************/
template <typename T>
int Array<T>::getLength()
{
	return m_length;
}
/*************************************************************************************************
* Purpose: Set length of Array
*
* Precondition: specified length must be positive value or 0
*
* Postcondition: Array will have specified length and values in the array that still fit in the
* Array will be preserved
***************************************************************************************************/
template <typename T>
void Array<T>::setLength(int length)
{
	if (length < 0)	//check for valid length
        throw ("Error! Length must be greater than 0");	//error message for invalid length
	
	T* temp = nullptr;		//create temp array with specified length
	temp = new T[length];
	int shortest = m_length < length ? m_length : length;	//value to determine for loop iterations

	for (int i = 0; i < shortest; i++)	//assign values from m_array to temp array
	{
		temp[i] = m_array[i];
	}

	delete[] m_array;	//delete old array and return to nullptr
	m_array = nullptr;	

	m_length = length;	//set new length
	m_array = temp;		//m_array points to new array
}
#endif
