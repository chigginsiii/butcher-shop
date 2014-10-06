require 'spec_helper'

describe User do
  it { should be_a_kind_of ActiveModel::ForbiddenAttributesProtection }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
end

# NOTE: both db/migrate and the model object user 'email', but if the
#       test was in fact correct and the implementation was wrong,
#       revert this change and update model/user and
#       db/migrate/(date)_create_user (or alter user)
