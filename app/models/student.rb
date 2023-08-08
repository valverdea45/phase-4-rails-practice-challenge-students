class Student < ApplicationRecord
    belongs_to :instructor

    validates :name, presence: true
    validates :major, presence: true
    validates :age, numericality: { greater_than_or_equal_to: 18}

    # class Blog < ApplicationRecord
    #     validates :likes, numericality: { greater_than: 1 }
    #   end
end
