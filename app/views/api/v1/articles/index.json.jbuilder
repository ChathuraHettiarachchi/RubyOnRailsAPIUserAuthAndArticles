articles = @reply
json.articles articles do |article|
  json.id article.id
  json.title article.title
  json.body article.body
  json.author do
    json.id article.user.id
    json.name article.user.name
    json.address article.user.address
  end
end