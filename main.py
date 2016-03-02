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
    # print "\n"
user_input = "select security_level from employees where username = '" + username + "'and security_level = 'S'"
try:
    cursor.execute(user_input)
    security_level = cursor.fetchone()
    
    print("type quit to exit program or help for available commands")
    user_input = raw_input("type your command: ")
    while(user_input != "quit"):
        if(user_input == ("create" or "update")):
            username = raw_input("input the username")
            security_level = raw_input("input the new security level for the user.")
            if(user_input == "create"):
                new_user_password = raw_input("input the new password")
                cursor.execute("CREATE USER '"+username+"'@'%' IDENTIFIED BY '"+new_user_password+"'")
                cursor.execute("INSERT INTO employees(username, role) VALUES("+username+","+security_level+")")
            elif(user_input == "update"):            
                cursor.execute("revoke all privileges on *.* from '"+username+"'@'%'")
            # if(security_level = "H"):
            #     cursor.execute("GRANT SELECT, INSERT on efmi222.human")
except:
    while (user_input != "quit"):
        
        user_input = raw_input("type in an instruction: ")
        if(user_input != ("quit" or "help" or "available")):
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
                
        elif(user_input == "available"):
            cursor.execute("show tables")
            
        elif(user_input == "help"):
            print("Type insert if you wish to insert a table")
            print("")
            
# disconnect from server                                                                                                                             
db.close()