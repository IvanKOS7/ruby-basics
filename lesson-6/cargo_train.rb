require_relative 'train'
require_relative 'instancecounter'
require_relative 'manufacturer'

class CargoTrain < Train
  def initialize(train_name, train_type = :cargo, train_number)
    super
  end
end
