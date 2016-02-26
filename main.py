#!/usr/bin/python                                                                                                                                    

import MySQLdb

#ask for username and password
username = raw_input("input UKY username: ")
password = raw_input("input UKY password: ")
database = raw_input("input database name: ")

# Open database connection                                                                                                                           
db = MySQLdb.connect("delphi.cs.engr.uky.edu",username,password,database )

# prepare a cursor object using cursor() method                                                                                                      
cursor = db.cursor()

# execute SQL query using execute() method.                                                                                                          
cursor.execute("SELECT * FROM roles")

# Fetch a single row using fetchone() method.                                                                                                        
data = cursor.fetchone()
print(data)

# disconnect from server                                                                                                                             
db.close()