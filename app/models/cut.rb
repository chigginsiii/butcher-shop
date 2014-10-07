class Cut < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :animal
  belongs_to :primal_cut

  validates :name, presence: :true

end
