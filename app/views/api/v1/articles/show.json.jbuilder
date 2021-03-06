# frozen_string_literal: true

json.status @reply[:status]
json.message @reply[:message]

article = @reply[:content]

unless article.nil?
  json.content do
    json.id article.id
    json.title article.title
    json.body article.body
    json.author do
      json.id article.user.id
      json.name article.user.name
    end
  end
end
