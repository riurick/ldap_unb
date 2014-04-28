require_dependency 'person'

class Person
  validates_uniqueness_of :matricula, :allow_nil => true
end
