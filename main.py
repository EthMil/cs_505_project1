#!/usr/bin/python                                                                                                                                    

import MySQLdb

#ask for username and password
username = raw_input("input username: ")
password = raw_input("input password: ")
user_input = "show tables"
rows = (())
# database = raw_input("input database name: ")
# Open database connection                                                                                                                           
db = MySQLdb.connect("localhost", username, password, "efmi222")

# prepare a cursor object using cursor() method                                                                                                      

cursor = db.cursor()
cursor.execute(user_input)
rows = cursor.fetchall()
for row in rows:
    for col in row:
        print "%s," %col
while (user_input != "quit"):
        
    user_input = raw_input("type in an instruction: ")
    if(user_input != ("quit" or "help" or "available")):
        try:
            cursor.execute(user_input)
            rows = cursor.fetchall()
        except MySQLdb.Error, e:
            print("You aren't allowed to make this query, the Security Log has been updated.")
            try:
                print "MySQL Error [%d]: %s" % (e.args[0], e.args[1])
            except IndexError:
                print "MySQL Error: %s" % str(e)
            cursor.execute("insert into log(username, query) VALUES('"+username+"', '"+user_input+"')")
    
        for row in rows:
            for col in row:
                print "%s," %col
                #print "\n"
                        
    elif(user_input == "available"):
        cursor.execute("show tables")
        
    elif(user_input == "help"):
        print("Type insert if you wish to insert a table")
        print("")
        
        # disconnect from server                                                                                                                             
db.close()
