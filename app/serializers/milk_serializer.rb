class MilkSerializer < ActiveModel::Serializer
  attributes :id, :farmer_id, :quantity, :quality, :status
end
