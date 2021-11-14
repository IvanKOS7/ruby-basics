# frozen_string_literal: true

require_relative 'train'
require_relative 'instancecounter'
require_relative 'manufacturer'

class CargoTrain < Train
  def initialize(train_name, train_number, train_type = 'cargo')
    super
  end
end
