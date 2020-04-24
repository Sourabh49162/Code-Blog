from flask import Flask, render_template, request, session, flash
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
import json
import os
import math
from werkzeug.utils import secure_filename
from datetime import datetime

with open('config.json', 'r') as jsonFile:
    jsonParams = json.load(jsonFile)["params"]

app = Flask(__name__)
app.secret_key = 'sourabh'
app.config['UPLOAD_FOLDER'] = 'static/img'
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = jsonParams['gmail_username'],
    MAIL_PASSWORD = jsonParams['gmail_password']
)
mail = Mail(app)

local_server = jsonParams['local_server']
if local_server:
    app.config["SQLALCHEMY_DATABASE_URI"] = jsonParams['local_uri']
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = jsonParams['prod_uri']

db = SQLAlchemy(app)

class Contacts(db.Model):
    _id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(200), unique=False, nullable=False)
    email = db.Column(db.String(100), unique=False, nullable=False)
    phone_num = db.Column(db.String(20), unique=False, nullable=False)
    message = db.Column(db.String(2000), unique=False, nullable=False)
    created_at = db.Column(db.String(20), unique=False, nullable=False)
    updated_at = db.Column(db.String(20), unique=False, nullable=False)
    status = db.Column(db.String(1), unique=False, nullable=False)

class Posts(db.Model):
    _id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(200), unique=False, nullable=False)
    sub_heading = db.Column(db.String(200), unique=False, nullable=False)
    slug = db.Column(db.String(50), unique=False, nullable=False)
    img_file = db.Column(db.String(100), unique=False, nullable=False)
    content = db.Column(db.String(10000), unique=False, nullable=False)
    author = db.Column(db.String(100), unique=False, nullable=False)
    created_at = db.Column(db.String(20), unique=False, nullable=False)
    updated_at = db.Column(db.String(20), unique=False, nullable=False)
    status = db.Column(db.String(1), unique=False, nullable=False)

@app.route('/')
def home():
    posts =  Posts.query.all()
    #[:jsonParams['no_of_posts']]
    last = math.ceil(len(posts)/int(jsonParams['no_of_posts']))
    page = request.args.get('page')
    if not(str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(jsonParams['no_of_posts']):(page-1)*int(jsonParams['no_of_posts'])+int(jsonParams['no_of_posts'])]
    if(page == 1):
        prev = '#'
        next = '/?page='+str(page+1)
    elif(page==last):
        prev = '/?page='+str(page-1)
        next = '#'
    else:
        prev = '/?page='+str(page-1)
        next = '/?page='+str(page+1)
    return render_template('index.html', params=jsonParams, posts=posts, prev=prev, next=next)

@app.route('/about')
def about():
    return render_template('about.html', params=jsonParams)

@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():
    if('user' in session and session['user'] == jsonParams['admin_username']):
        posts = Posts.query.all()
        return render_template('dashboard.html', params=jsonParams, posts=posts)
    
    elif request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        if(username == jsonParams['admin_username'] and password == jsonParams['admin_password']):
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params=jsonParams, posts=posts)

    return render_template('sign_in.html', params=jsonParams)

@app.route('/edit/<string:id>', methods= ['GET', 'POST'])
def edit(id):
    if('user' in session and session['user'] == jsonParams['admin_username']):
        if request.method == 'POST':
            title = request.form.get('title')
            tagline = request.form.get('tagline')
            slug = request.form.get('slug')
            author = request.form.get('author')
            img_file = request.form.get('img_file')
            content = request.form.get('content')

            if(id == '0'):
                entry = Posts(title=title, sub_heading=tagline, slug=slug, img_file=img_file, author=author, content=content, created_at=datetime.now(), updated_at=datetime.now(), status='1')
                db.session.add(entry)
                db.session.commit()
                return redirect('/dashboard')
            else:
                post = Posts.query.filter_by(_id=id).first()
                post.title = title
                post.sub_heading = tagline
                post.slug = slug
                post.img_file = img_file
                post.author = author
                post.content = content
                post.updated_at = datetime.now()
                db.session.commit()
                return redirect('/dashboard')

        post = Posts.query.filter_by(_id=id).first()
        return render_template('edit.html', params=jsonParams, post=post, id=id)

@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route('/uploader', methods=['GET', 'POST'])
def uploader():
    if('user' in session and session['user'] == jsonParams['admin_username']):
        if request.method == 'POST':
            file_input = request.files['file']
            file_input.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(file_input.filename)))
            return redirect('/dashboard')

@app.route('/delete/<string:id>', methods= ['GET', 'POST'])
def delete(id):
    if('user' in session and session['user'] == jsonParams['admin_username']):
        post = Posts.query.filter_by(_id=id).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/dashboard')

@app.route('/contact', methods = ['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, email=email, phone_num=phone, message=message, created_at=datetime.now(), updated_at=datetime.now(), status='1')
        db.session.add(entry)
        db.session.commit()
        mail.send_message('CODE BLOG: New Message From '+name, sender=email, recipients=[jsonParams['gmail_username']], body=message+'\n\n'+name+'\n'+email+'\n'+phone)
        flash('Thanks for submitting your details. We will contact you soon.', 'success')
    return render_template('contact.html', params=jsonParams)

@app.route('/post/<string:post_slug>', methods= ['GET'])
def postFunc(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=jsonParams, post=post)

app.run(debug=True)