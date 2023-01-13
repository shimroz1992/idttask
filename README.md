## Install

### Clone the repository

```bash
git clone https://github.com/shimroz1992/idttask.git
cd idttask

```

### Check your Ruby version

```bash
ruby -v
```

The ouput should start with something like `ruby 3.0.0`

If not, install the right ruby version using rvm (it could take a while):

```bash
rvm install "ruby-3.0.0"
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```bash
bundle
```

### Update database.yml file
In database.yml file, edit the database configuration if required.

### Initialize the database

```ruby
rails db:create db:migrate db:seed
```

### Serve

```ruby
rails s
```
And now you can visit the site with the URL http://localhost:3000/api-docs/index.html

### Additonal Info
if you create changes in spec folder
run below command

```bash
rails rswag 
```

![Screenshot from 2023-01-13 21-07-31](https://user-images.githubusercontent.com/16288470/212359023-c400e515-eb36-473d-9ce2-ea9befe69229.png)

