require_relative 'train'
require_relative 'manufacturer'
require_relative 'instancecounter'
class PassengerTrain < Train
  def initialize(train_name, train_type = 'passenger', train_number)
    super
  end
end
