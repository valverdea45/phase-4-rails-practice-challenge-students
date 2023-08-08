class StudentAssociatedWithInstructorSerializer < ActiveModel::Serializer
  attributes :name

  belongs_to :instructor
end
