#!/usr/bin/python                                                                                                                                    

import MySQLdb

user_input = ""
#ask for username and password
username = raw_input("input username: ")
password = raw_input("input password: ")
# database = raw_input("input database name: ")
    
while (user_input != "quit"):

    # Open database connection                                                                                                                           
    # db = MySQLdb.connect("delphi.cs.engr.uky.edu",username,password,database )
    db = MySQLdb.connect("localhost", username, password, "efmi222")
    
    # prepare a cursor object using cursor() method                                                                                                      
    cursor = db.cursor()
    user_input = raw_input()
    
    try:
        cursor.execute(user_input)
        rows = cursor.fetchall()
    except MySQLdb.Error, e:
        try:
            print "MySQL Error [%d]: %s" % (e.args[0], e.args[1])
        except IndexError:
            print "MySQL Error: %s" % str(e)
    
    for row in rows:
        for col in row:
            print "%s," %col
        print "\n"
        
    
    
    # execute SQL query using execute() method.                                                                                                          
    # cursor.execute(user_input)
    
    # # Fetch a single row using fetchone() method.                                                                                                        
    # data = cursor.fetchone()
    # print('\n')
    # print(data)
    user_input = raw_input("type next instruction: ")
# disconnect from server                                                                                                                             
db.close()