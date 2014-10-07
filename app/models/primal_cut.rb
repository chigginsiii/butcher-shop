class PrimalCut < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_many   :cuts
  belongs_to :animal

  validates :name, :presence => true

end
