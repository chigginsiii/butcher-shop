FactoryGirl.define do

  factory :animal do
    name "TestCow"

    after :create do |a|
      create(:primal_cut, animal: a)
    end
  end

  factory :primal_cut do
    name "Chuck"

    after :create do |p|
      create(:cut, primal_cut: p )
    end
  end

  factory :cut do
    name "Shoulder Steak"
  end


end
