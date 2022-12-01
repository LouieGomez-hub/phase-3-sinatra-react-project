class Comment < ActiveRecord::Base
    belongs_to :superhero
    validates :text, presence: true
end