#!/usr/bin/python                                                                                                                                    

import MySQLdb

def print_table(results):
    widths = []
    columns = []
    tavnit = '|'
    separator = '+'
    

    for cd in cursor.description:
        widths.append(max(cd[2], len(cd[0])))
        columns.append(cd[0])
        
    for w in widths:
        tavnit += " %-"+"%ss |" % (w,)
        separator += '-'*w + '--+'

    print(separator)
    print(tavnit % tuple(columns))
    print(separator)
    for row in results:
        print(tavnit % row)
    print(separator)
    
#ask for username and password
username = raw_input("input username: ")
password = raw_input("input password: ")
user_input = "show tables"
rows = (())
# database = raw_input("input database name: ")
# Open database connection                                                                                                                           
db = MySQLdb.connect("localhost", username, password, "G")

# prepare a cursor object using cursor() method                                                                                                      

cursor = db.cursor()
cursor.execute(user_input)
rows = cursor.fetchall()
print_table(rows)
print('\n')
while (user_input != "quit"):
        
    user_input = raw_input("type in an instruction: ")
    if(user_input != ("quit" or "help" or "available")):
        try:
            cursor.execute(user_input)
            rows = cursor.fetchall()
        except MySQLdb.Error, e:
            print("You aren't allowed to make this query, the Security Log has been updated.")
            # cursor.execute("insert into S.log(username, query) VALUES(%s, %s)'"+username+"', '"+user_input+"')")
            cursor.execute("insert into S.log(username, query) VALUES(%s, %s)",(username, user_input))
            db.commit()
        try:
            print_table(rows)
        except:
            db.commit()
                        
    elif(user_input == "available"):
        cursor.execute("show tables")
        
    elif(user_input == "help"):
        print("Type insert if you wish to insert a table")
        print("")
        
# disconnect from server
db.close()
