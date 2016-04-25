/***************************************************************************************
* Class: Row
*
* Purpose: The Row class is used to access the column value in the two-dimensional array 
*		   class.
*
* Manager Functions:
*						Row(const Array2D<T>& array, int row)
*							instantiates Row object with passed in Array2D object by 
*							reference and row number
*						Row(const Row<T> &copy)
*						~Row()
*
* Methods:				
*						T& operator[](int col) const
*							overloaded subscript operator - returns data from array 
*****************************************************************************************/
#ifndef ROW_H
#define ROW_H

template <typename T>	//forward declaration
class Array2D;

template <typename T>
class Row
{
	friend class Array2D<T>;

public:
	Row(const Array2D<T>& array, int row);	//two-arg ctor
	Row(const Row<T> &copy);			//copy ctor
	~Row();								//dtor
	T& operator[](int col) const;		//overloaded subscript op

private:
	const Array2D<T>& m_array2D;		//Array2D object
	int m_row;					//row number
};
/*************************************************************************************************
* Purpose: Constructor to instantiate a Row object with passed in Array2D object by reference and
* specified row value.
*
* Precondition: instantiate Row object with Array2D object passed by reference and specified row
* row value must be greater than 0 or greater or exception will be thrown
*
* Postcondition: Row object created with passed in Array2D by reference and specified row value
***************************************************************************************************/
template <typename T>
Row<T>::Row(const Array2D<T>& array, int row) : m_array2D(array), m_row(row)
{
	//cout << "row one-arg ctor" << endl;
}
/*************************************************************************************************
* Purpose: Copy Constructor
*
* Precondition: create copy of Row object
*
* Postcondition: copy of Row object created
***************************************************************************************************/
template <typename T>
Row<T>::Row(const Row<T> &copy) : m_array2D(copy.m_array2D), m_row(copy.m_row)
{
	//cout << "row copy ctor" << endl;
}
/*************************************************************************************************
* Purpose: Destructor to release dynamically allocated space
*
* Precondition: Row object destroyed or falls out of scope
*
* Postcondition: Row object destroyed and returned to default values
***************************************************************************************************/
template <typename T>
Row<T>::~Row()
{
	m_row = 0;
	//cout << "row dtor" << endl;
}
/*************************************************************************************************
* Purpose: Overloaded operator[] to located data in 2D array at correct row and column
*
* Precondition: pass in target column from 2D array
*
* Postcondition: return value from Select function which returns data at target row and col in array
***************************************************************************************************/
template <typename T>
T& Row<T>::operator[](int col) const
{
	if (col >= m_array2D.getColumns() || col < 0)	
		throw Exception ("Error! Column index out of array bounds!"); //exception object

	return m_array2D.Select(m_row, col);	//return data at array location
}
#endif