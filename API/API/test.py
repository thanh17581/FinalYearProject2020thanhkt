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

idR = 2

try:
    connection = mysql.connector.connect(host='localhost',
                                            database='restaurant',
                                            user='root',
                                            password='')

    cursor = connection.cursor()
    cursor.execute("SELECT * FROM restaurant_food_detail INNER JOIN food ON food.idF = restaurant_food_detail.idF WHERE restaurant_food_detail.idR=%d" %idR)
    records = cursor.fetchall()
    resFood = []
    for row in records:
        print(row[0])
        print(row[1])
        print(row[2])
        print(row[3])
        print(row[4])
        print(row[5])
        print(row[6])
        print(row[7])
        print(row[8])
except Error as e:
    print("Error reading data from MySQL table", e)
finally:
    if (connection.is_connected()):
        connection.close()
        cursor.close()

