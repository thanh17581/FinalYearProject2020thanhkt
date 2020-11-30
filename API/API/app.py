from flask import Flask, jsonify, request
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)
true = True
false = False

dataR = [dict]
dataF = [dict]
dataC = [dict]
account = [dict]
profile = dict
resFood = [dict]

try:
    connection = mysql.connector.connect(host='localhost',
                                         database='restaurant',
                                         user='root',
                                         password='')
    sql_select_Query = "select * from restaurant"
    cursor = connection.cursor()
    cursor.execute(sql_select_Query)
    records = cursor.fetchall()
    for row in records:
        dataR.append(dict(
            id=row[0],
            name=row[1],
            place=row[2],
            deliveryTime=row[3],
            rating=row[4],
            ratingCount=row[5],
            image=row[6],
        ))
except Error as e:
    print("Error reading data from MySQL table", e)
finally:
    if (connection.is_connected()):
        connection.close()
        cursor.close()

try:
    connection = mysql.connector.connect(host='localhost',
                                         database='restaurant',
                                         user='root',
                                         password='')
    sql_select_Query = "select * from food"
    cursor = connection.cursor()
    cursor.execute(sql_select_Query)
    records = cursor.fetchall()
    for row in records:
        dataF.append(dict(
            id=row[0],
            name=row[1],
            image=row[2],
            price=row[3],
            rating=row[4],
            ratingCount=row[5],
        ))
except Error as e:
    print("Error reading data from MySQL table", e)
finally:
    if (connection.is_connected()):
        connection.close()
        cursor.close()

try:
    connection = mysql.connector.connect(host='localhost',
                                         database='restaurant',
                                         user='root',
                                         password='')
    sql_select_Query = "select * from category"
    cursor = connection.cursor()
    cursor.execute(sql_select_Query)
    records = cursor.fetchall()
    for row in records:
        dataC.append(dict(
            id=row[0],
            name=row[1],
            image=row[2],
        ))
except Error as e:
    print("Error reading data from MySQL table", e)
finally:
    if (connection.is_connected()):
        connection.close()
        cursor.close()

try:
    connection = mysql.connector.connect(host='localhost',
                                         database='account',
                                         user='root',
                                         password='')
    sql_select_Query = "select * from account"
    cursor = connection.cursor()
    cursor.execute(sql_select_Query)
    records = cursor.fetchall()
    for row in records:
        account.append(dict(
            username=row[1],
            password=row[2],
        ))
except Error as e:
    print("Error reading data from MySQL table", e)
finally:
    if (connection.is_connected()):
        connection.close()
        cursor.close()

@app.route("/restaurant")
def restaurant_api():
    dataR_r = dataR[1:]
    return jsonify(data=dataR_r,status=200, message="success")

@app.route("/food")
def all_food_api():
    dataF_f = dataF[1:]
    return jsonify(data=dataF_f, status=200, message="success")

@app.route("/category")
def category_api():
    dataC_c = dataC[1:]
    return jsonify(data=dataC_c, status=200, message="success")

@app.route("/login", methods=["POST"])
def login_api():
    if request.args.get("username"):
        username = request.args.get("username")
        password = request.args.get("password")
        a = {'username':username, 'password':password}
        if a in account:
            return jsonify(message="success", status=200)
        else:
            return jsonify(message="fail", status=500)
    else:
        return jsonify(message="fail", status=500)

@app.route("/signup", methods=["POST"])
def signup_api():
    if request.args.get("email"):
        username = str(request.args.get("email"))
        password = str(request.args.get("password"))
        name = str(request.args.get("name"))
        age = "18"
        email = str(request.args.get("email"))
        try:
            connection = mysql.connector.connect(host='localhost',
                                                 database='account',
                                                 user='root',
                                                 password='')

            cursor = connection.cursor()
            cursor.execute("INSERT INTO account(username, password, name, age, email) VALUES (%s, %s, %s, %s, %s)",
                           (username, password, name, age, email))
            connection.commit()
        except Error as e:
            print("Error reading data from MySQL table", e)
            return jsonify(mesage="fail", status=500)
        finally:
            if (connection.is_connected()):
                return jsonify(mesage="success", status=200)
                connection.close()
                cursor.close()

@app.route("/profile", methods=["POST"])
def get_profile_api():
    if request.args.get("username"):
        username = request.args.get("username")
        password = request.args.get("password")
        try:
            connection = mysql.connector.connect(host='localhost',
                                                 database='account',
                                                 user='root',
                                                 password='')
            cursor = connection.cursor()
            cursor.execute("SELECT * FROM account WHERE username=(%s) and  password=(%s)",
                           (username, password))
            records = cursor.fetchall()
            for row in records:
                profile = dict(
                    id=row[0],
                    username=row[1],
                    password=row[2],
                    name=row[3],
                    age=row[4],
                    email=row[5],
                )
        except Error as e:
            print("Error reading data from MySQL table", e)
            return jsonify(mesage="fail", status=500)
        finally:
            if (connection.is_connected()):
                return jsonify(data=profile, message="success", status=200)
                connection.close()
                cursor.close()

@app.route("/retaurantFood", methods=["POST"])
def get_res_food_api():
    if request.args.get("id"):
        id = request.args.get("id")
        try:
            connection = mysql.connector.connect(host='localhost',
                                                 database='restaurant',
                                                 user='root',
                                                 password='')
            cursor = connection.cursor()
            cursor.execute("SELECT * FROM food INNER join restaurant_food_detail on food.idF = restaurant_food_detail.idF WHERE restaurant_food_detail.idR = 2")
            records = cursor.fetchall()
            for row in records:
                resFood.append(dict(
                    id=row[0],
                    name=row[1],
                    image=row[2],
                    price=row[3],
                    rating=row[4],
                    ratingCount=row[5],
                ))

        except Error as e:
            print("Error reading data from MySQL table", e)
            return jsonify(mesage="fail", status=500)
        finally:
            if (connection.is_connected()):
                resFoor_f = resFood[1:]
                return jsonify(data=resFoor_f, message="success", status=200)
                connection.close()
                cursor.close()


if __name__ == "__main__":
    app.run(debug=1)
