#!/usr/bin/python                                                                                                                                    

import MySQLdb

#ask for username and password
username = raw_input("input username: ")
password = raw_input("input password: ")
user_input = ""
rows = (())
# database = raw_input("input database name: ")
print("type quit to exit program or help for available instructions")
# Open database connection                                                                                                                           
db = MySQLdb.connect("localhost", username, password, "efmi222")

# prepare a cursor object using cursor() method                                                                                                      
cursor = db.cursor()

while (user_input != "quit"):
    user_input = raw_input("type in an instruction: ")
    if(user_input != ("quit" or "help")):
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
            
        
        # disconnect from server                                                                                                                             
db.close()