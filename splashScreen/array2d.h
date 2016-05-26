/***************************************************************************************
* Class: Array2D
*
* Purpose: This class dynamically creates a templated, two-dimensional array using a 
*          one-dimensional array class data member.
*
* Manager Functions:
*						Array2D()
*							default ctor instantiates 2D array with 0 rows and columns
*						Array2D(int row, int col)
*						instantiates 2D array with specified rows and columns
*						Array2D(const Array2D<T> &copy)
*						Array2D<T>& operator=(const Array2D<T> & rhs)
*						~Array2D()
*
* Methods:				
*						Row operator[](int row) const		
*							overloaded subscript op
*						int getRow() const		
*							return row
*						int getCol() const
*							return column
*						void setRow(int row)
*							set # of rows
*						void setCol(int col)
*							set # of columns
*						T& Select(int row, int col) const
*							return data from array
*****************************************************************************************/
#ifndef ARRAY2D_H
#define ARRAY2D_H

#include <iomanip>
#include "array.h"
#include "row.h"

#include <iostream>
using std::endl;
using std::cout;

using std::setw;
using std::left;

template <typename T>
class Array2D
{
public:
	Array2D();									//default ctor
	Array2D(int row, int col);					//two-arg ctor
	Array2D(const Array2D<T> &copy);			//copy ctor
	Array2D<T>& operator=(const Array2D &rhs);	//op= ctor
	~Array2D();									//dtor

	Row<T> operator[](int row) const;		//overloaded subscript op
	int getRow() const;						//return row
    int getColumns() const;					//return column
	void setRow(int row);					//set row
    void setColumns(int col);				//set column
	T& Select(int row, int col) const;		//return item from array
	void DisplayArray() const;				//display data in array

protected:
	Array<T> m_array;	//1D array object
	int m_row;			//#rows in array	
	int m_col;			//#columns in array
};
/*************************************************************************************************
* Purpose: Default constructor to instantiate 2DArray object with default values
*
* Precondition: instantiate 2DArray object without specified values
*
* Postcondition: 2DArray object created with default values
***************************************************************************************************/
template <typename T>
Array2D<T>::Array2D() : m_row(0), m_col(0)
{
	//cout << "2D default ctor" << endl;
}
/*************************************************************************************************
* Purpose: Constructor to instantiate an Array 2D object with a specified number of rows and columns
*
* Precondition: instantiate Array2D object with specified number of rows and columns. Number of 
* rows and columns of 2D array must be 0 or greater or exception will be thrown
*
* Postcondition: Array2D object created with specified number of rows and columns
***************************************************************************************************/
template <typename T>
Array2D<T>::Array2D(int row, int col) : m_row(0), m_col(0)
{
	if (row < 0 || col < 0)
        throw ("Error! Array number of rows and columns must be 0 or greater. Array not created.");

	m_row = row;
	m_col = col;

	int length = m_row * m_col;	//length of 1D array
	
	m_array.setLength(length); //create array of correct length	
	
	//cout << "2D two-arg ctor" << endl;
}
/*************************************************************************************************
* Purpose: Copy Constructor
*
* Precondition: create copy of Array2D object
*
* Postcondition: copy of Array2D object created
***************************************************************************************************/
template <typename T>
Array2D<T>::Array2D(const Array2D<T> &copy) : m_row(0), m_col(0)
{
	*this = copy;
	//cout << "2D copy ctor" << endl;
}
/*************************************************************************************************
* Purpose: Overloaded operator= constructor
*
* Precondition: assign an Array2D object to another Array2D object or when copy constructor is called
*
* Postcondition: Array2D object assigned the value of another Array2D object or copy of Array2D object created
***************************************************************************************************/
template <typename T>
Array2D<T>& Array2D<T>::operator=(const Array2D<T> &rhs)
{
	if (this != &rhs)
	{
		m_array = rhs.m_array;
		m_row = rhs.m_row;
		m_col = rhs.m_col;
	}

	//cout << "2D op= ctor" << endl;

	return *this;
}
/*************************************************************************************************
* Purpose: Destructor to release dynamically allocated space
*
* Precondition: Array2D object destroyed or falls out of scope
*
* Postcondition: Array2D object destroyed and returned to default values
***************************************************************************************************/
template <typename T>
Array2D<T>::~Array2D()
{
    m_row = 0;
    m_col = 0;

	//cout << "2D dtor" << endl;
}
/*************************************************************************************************
* Purpose: Overloaded operator[] to located data in 2D array at correct row and column
*
* Precondition: pass in target row from 2D array
*
* Postcondition: return Row object from Row class instantiated with Array2D object and target row
***************************************************************************************************/
template <typename T>
Row<T> Array2D<T>::operator[](int row) const
{
	if (row >= m_row || row < 0)
        throw ("Error! Row index out of array bounds!"); //exception object

	return Row<T>(*this, row);	//return Row object
}
/*************************************************************************************************
* Purpose: Get number of rows in 2D-array
*
* Precondition: none
*
* Postcondition: Return number of rows in 2D-array
***************************************************************************************************/
template <typename T>
int Array2D<T>::getRow() const
{
	return m_row;
}
/*************************************************************************************************
* Purpose: Get number of columns in 2D-array
*
* Precondition: none
*
* Postcondition: Return number of columns in 2D-array
***************************************************************************************************/
template <typename T>
int Array2D<T>::getColumns() const
{
	return m_col;
}
/*************************************************************************************************
* Purpose: Set number of rows in 2D Array
*
* Precondition: pass in desired number of rows
*
* Postcondition: Resize array to new number of rows and move values from old array into resized array
*                Decreasing the size of the array will result in data loss
***************************************************************************************************/
template <typename T>
void Array2D<T>::setRow(int row)
{
	if (row < 0)
        throw ("Error! Number of rows must be 0 or greater.");

	m_row = row;		//set new row value
	int length = m_row * m_col;	//new length of array

	m_array.setLength(length);	//set new length
}
/*************************************************************************************************
* Purpose: Set number of columns in 2D Array
*
* Precondition: pass in desired number of columns
*
* Postcondition: Resize array to new num of columns and move values from old array into resized array
*                Decreasing the size of the array will result in data loss
***************************************************************************************************/
template <typename T>
void Array2D<T>::setColumns(int col)
{
	if (col < 0)
        throw ("Error! Number of columns must be 0 or greater.");

	int length = m_row * col;		//new length of array
	Array<T> temp(length);			//create temp array 
	int t_index = 0;				//index for for temp array
	int m_index = 0;				//index for m_array array
	int shortest = col < m_col ? col : m_col;	//value to determine for loop iterations

	for (int i = 0; i < m_row; i++)
	{
		for (int ii = 0; ii < shortest; ii++)
		{
			temp[t_index] = m_array[m_index];	//add data from m_array to temp array
			t_index++;	     //increment index
			m_index++;		//increment add
		}
		if (shortest == m_col)
		{
			t_index = t_index + (col - m_col);	//increment temp index for new columns
		}
		else
		{
			m_index = m_index + (m_col - col);	//increment m_array index for reducing columns
		}
	}

	m_array.setLength(length);	//set m_array to new size
	m_array = temp;		//move new values from temp array to m_array
	m_col = col;		//set new column value
}
/*************************************************************************************************
* Purpose: Get data from 2D-array at target row and target column
*
* Precondition: pass in target row and target column
*
* Postcondition: return value from 2D array
***************************************************************************************************/
template <typename T>
T& Array2D<T>::Select(int row, int col) const
{
	int target = (row) * m_col + (col);		//target data index

	return m_array[target];			//return data at target index
}
/*************************************************************************************************
******************************************FOR TESTING ONLY!!!!***********************************
***************************************************************************************************/
template <typename T>
void Array2D<T>::DisplayArray() const
{
	for (int i = 0; i < m_row; i++)
	{
		for (int ii = 0; ii < m_col; ii++)
		{
			cout << left << setw(10) << Select(i, ii) << "   ";
		}
		cout << endl;
	}
}
#endif
