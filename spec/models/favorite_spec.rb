require 'spec_helper'

describe Favorite do
  it { should be_a_kind_of ActiveModel::ForbiddenAttributesProtection }

  it { should belong_to :user }
  it { should belong_to :cut }
end
