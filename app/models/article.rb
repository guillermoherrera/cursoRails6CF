class Article < ApplicationRecord
    has_rich_text :contenido
    belongs_to :user
end
