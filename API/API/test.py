# # a = [
# #     {'id': 'The Jungle Beehive', 'place': 'Hanoi, Vietnam'}, {'id': 'The Cocoa Bites', 'place': 'USA'},
# #     {'id': 'The Waterway Devil', 'place': 'Thailand'}, {'id': 'The Jungle Beehive', 'place': 'Hanoi, Vietnam'},
# #     {'id': 'The Light Paradise', 'place': 'Thailand'}, {'id': 'The Silk Exhibit', 'place': 'USA'},
# #     {'id': 'The Abacus Hook', 'place': 'Thailand'}, {'id': 'Gentle', 'place': 'China'},
# #     {'id': 'The Crystal Cow', 'place': 'China'}
# # ]
# #
# # x = {'id': 'The Crystal', 'place': 'China'}
# # if x in a:
# #     print("login true")
# # else:
# #     print("login error")
# #
# # print(a[:1])
import mysql.connector
from mysql.connector import Error

# # username = "thanh"
# # password = "thanh"
# # name = "John"
# # age = "18"
# # email = "john@abc.com"
# # try:
# #     connection = mysql.connector.connect(host='localhost',
# #                                          database='account',
# #                                          user='root',
# #                                          password='')
# #
# #     cursor = connection.cursor()
# #     cursor.execute("INSERT INTO account(username, password, name, age, email) VALUES (%s, %s, %s, %s, %s)", (username,password,name,age,email))
# #     connection.commit()
# # except Error as e:
# #     print("Error reading data from MySQL table", e)
# # finally:
# #     if (connection.is_connected()):
# #         connection.close()
# #         cursor.close()


# username = "thanh"
# password = "thanh"
# try:
#     connection = mysql.connector.connect(host='localhost',
#                                          database='account',
#                                          user='root',
#                                          password='')

#     cursor = connection.cursor()
#     cursor.execute("SELECT * FROM account WHERE username=(%s) and  password=(%s)",
#                    (username, password))
#     records = cursor.fetchall()
#     for row in records:
#         print(row[0])
#         print(row[1])
#         print(row[2])
#         print(row[3])
#         print(row[4])
# except Error as e:
#     print("Error reading data from MySQL table", e)
# finally:
#     if (connection.is_connected()):
#         connection.close()
#         cursor.close()

wR = 0
w = 0

try:
    connection = mysql.connector.connect(host='localhost',
                                            database='account',
                                            user='root',
                                            password='')

    cursor = connection.cursor()
    cursor.execute("SELECT * FROM account_bank_detail WHERE account_bank_detail.idA=1")
    records = cursor.fetchall()
    
    for row in records:
        wR = int(row[2])

    wR = wR - 500

    cursor = connection.cursor()
    cursor.execute("SELECT * FROM account_bank_detail WHERE account_bank_detail.idA=2")
    records = cursor.fetchall()
    
    for row in records:
        w = int(row[2])

    w = w + 500

    cursor = connection.cursor()
    cursor.execute("UPDATE account_bank_detail SET account_bank_detail.wallet = %r WHERE account_bank_detail.idA = 1" %wR)
    connection.commit()

    cursor = connection.cursor()
    cursor.execute("UPDATE account_bank_detail SET account_bank_detail.wallet = %r WHERE account_bank_detail.idA = 2" %w)
    connection.commit()

except Error as e:
    print("Error reading data from MySQL table", e)
finally:
    if (connection.is_connected()):
        connection.close()
        cursor.close()

