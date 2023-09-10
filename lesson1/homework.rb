require 'httparty'
require 'nokogiri'

# парсим категорию рандомных анекдотов
url = 'https://www.anekdot.ru/random/anekdot/'
response = HTTParty.get(url)

# получаем рандомный анекдот
if response.code != 200
  puts 'не удалось получить данные с веб-сайта'
else
  random_number = rand(0..10)
  doc = Nokogiri::HTML(response.body)
  puts doc.css('.text')[random_number].text
end
