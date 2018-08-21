require 'database_cleaner'
DatabaseCleaner.clean_with(:truncation)
PASSWORD = 'password'

user_safargaliev = User.create!(email: 'safargaliev@kodep.ru', password: PASSWORD)
user_malyshev = User.create!(email: 'malyshev@kodep.ru', password: PASSWORD)
user_sidorenko = User.create!(email: 'sidorenko@kodep.ru', password: PASSWORD)