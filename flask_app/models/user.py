from flask import flash
from flask_app.config.mysqlconnection import connectToMySQL
from datetime import datetime

import re 
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')


class User:
    db = "pokes_schema"
    def __init__(self,data):
        self.id = data['id']
        self.name = data['name']
        self.alias = data['alias']
        self.email = data['email']
        self.password = data['password']
        self.dob = data['dob']
        self.created_at = data['created_at']
        self.updated_at = data['updated_at']

    @classmethod
    def save(cls,data):
        query = "INSERT INTO users (name,alias,email,password,dob,created_at, updated_at) VALUES(%(name)s,%(alias)s,%(email)s,%(password)s,%(dob)s,NOW(),NOW())"
        return connectToMySQL(cls.db).query_db(query,data)

    @classmethod
    def get_all(cls):
        query = "SELECT * FROM users;"
        results = connectToMySQL(cls.db).query_db(query)
        users = []
        for user in results:
            users.append( cls(user))
        return users

    @classmethod
    def get_by_email(cls,data):
        query = "SELECT * FROM users WHERE email = %(email)s;"
        results = connectToMySQL(cls.db).query_db(query,data)
        if len(results) < 1:
            return False
        return cls(results[0])

    @classmethod
    def get_by_id(cls,data):
        query = "SELECT * FROM users WHERE id = %(id)s;"
        results = connectToMySQL(cls.db).query_db(query,data)
        return cls(results[0])

    @classmethod
    def make_poke(cls,data):
        query = "INSERT INTO pokes (user_id,poked_id,created_at,updated_at) VALUES (%(user_id)s,%(poked_id)s, NOW(), NOW());"
        return connectToMySQL(cls.db).query_db(query,data)

    @classmethod
    def poke_list(cls,data):
        query = "SELECT users.id, users.name, users.alias, users.email, count(users.id) FROM users LEFT JOIN pokes ON users.id = pokes.user_id WHERE users.id <> %(id)s GROUP BY users.id;"
        results = connectToMySQL(cls.db).query_db(query,data)
        poke_list = []
        for user in results:
            poke_list.append(user)
        return poke_list

    @classmethod
    def count_pokes(cls,data):
        query = "SELECT users.alias, pokes.user_id, COUNT(*) AS count FROM pokes JOIN users ON pokes.user_id = users.id WHERE pokes.poked_id = %(id)s GROUP BY user_id ORDER BY COUNT(*) DESC;"
        results = connectToMySQL(cls.db).query_db(query,data)
        counts = []
        for count in results:
            counts.append(count)
        return counts

    @classmethod
    def total_pokes(cls):
        query = "SELECT user_id, COUNT(*) AS total_pokes FROM pokes GROUP BY user_id;"
        results = connectToMySQL(cls.db).query_db(query)
        total = []
        for x in results:
            total.append(x)
        return total

    @staticmethod
    def today():
        date = datetime.today().strftime('%Y-%m-%d')
        return date

    @staticmethod
    def validate_register(user):
        is_valid = True
        query = "SELECT * FROM users WHERE email = %(email)s;"
        results = connectToMySQL(User.db).query_db(query,user)
        if len(results) >= 1:
            flash("This email is already registerd","register")
            is_valid=False
        if not EMAIL_REGEX.match(user['email']):
            flash("Invalid Email!!!","register")
            is_valid=False
        if len(user['name']) < 4:
            flash("Name must be at least 4 characters","register")
            is_valid= False
        if len(user['alias']) < 3:
            flash("Alias must be at least 3 characters","register")
            is_valid= False
        if len(user['password']) < 8:
            flash("Password must be at least 8 characters","register")
            is_valid= False
        if user['password'] != user['confpw']:
            flash("Passwords don't match","register")
        dob = user['dob']
        if dob:
            dob = datetime.strptime(dob, '%Y-%m-%d')
            today = datetime.today()
            age = today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))
            if age < 16:
                flash("You must be at least 16 years old to register","register")
                is_valid = False
        else:
            flash("Please enter your date of birth","register")
            is_valid= False
        return is_valid