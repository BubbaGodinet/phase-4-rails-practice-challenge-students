class Instructor < ApplicationRecord
    validates :name, presence: true
    has_many :students, dependent: :nullify 
    # :dependent :destroy also works here but will get rid of students
end
