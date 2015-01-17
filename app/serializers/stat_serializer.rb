class StatSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :weighted_mean
end
