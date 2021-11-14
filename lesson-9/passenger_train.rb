# frozen_string_literal: true

require_relative 'train'
require_relative 'manufacturer'
require_relative 'instancecounter'
class PassengerTrain < Train
  def initialize(train_name, train_number, train_type = 'passenger')
    super
  end
end
