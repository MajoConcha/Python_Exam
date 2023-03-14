from flask import render_template,redirect,session,request, flash
from flask_app import app
from flask_app.models.user import User
from flask_bcrypt import Bcrypt

bcrypt = Bcrypt(app)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/register',methods=['POST'])
def register():
    if not User.validate_register(request.form):
        return redirect('/')
    data ={ 
        "name": request.form['name'],
        "alias": request.form['alias'],
        "email": request.form['email'],
        "password": bcrypt.generate_password_hash(request.form['password']),
        "dob": request.form['dob']
    }
    id = User.save(data)
    session['user_id'] = id
    return redirect('/dashboard')

@app.route('/login',methods=['POST'])
def login():
    user = User.get_by_email(request.form)
    if not user:
        flash("Invalid Email","login")
        return redirect('/')
    if not bcrypt.check_password_hash(user.password, request.form['password']):
        flash("Invalid Password","login")
        return redirect('/')
    session['user_id'] = user.id
    return redirect('/dashboard')

@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:
        return redirect('/logout')
    data ={
        'id': session['user_id']
    }
    user = User.get_by_id(data)
    users = User.get_all()
    count = User.count_pokes(data)
    amount_pokers = len(count)
    poke_list = User.poke_list(data)
    total_pokes = User.total_pokes()
    return render_template('dashboard.html',user=user, users=users, count=count, poke_list=poke_list, ap=amount_pokers, tp=total_pokes)

@app.route('/poke' ,methods=['POST'])
def make_poke():
    data = {
        'user_id': request.form['user_id'],
        'poked_id': request.form['poked_id']
    }
    User.make_poke(data)
    return redirect('/dashboard')

@app.route('/logout')
def logout():
    session.clear()
    return redirect('/')