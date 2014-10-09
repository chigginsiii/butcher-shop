class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :cut_id, :created_at, :updated_at
  # i suspect the hint about how to include the Cut information
  # is pointing here, but I'm not sure. 
end
