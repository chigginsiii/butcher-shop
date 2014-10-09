require 'spec_helper'

describe FavoritesController do

  # I clearly need to spend a buncha time with the rspec book,
  # but this'll do for a first pass.
  let!(:animal) { FactoryGirl.create(:animal) }
  let(:cut)    { animal.primal_cuts[0].cuts[0] }
  let!(:user)   { FactoryGirl.create(:user) }

  let(:favorite_attrs) do
    cut.save!
    {
      :user_id => user.id,
      :format => :json,
      :favorite => { :cut_id => cut.id }
    }
  end

  let(:bad_favorite_attrs) do
    {
      :user_id => user.id,
      :format => :json,
      :favorite => {}
    }
  end

  describe "GET 'index'" do

    before(:each) do
      user.favorites.create(cut: cut)
      get :index, :user_id => user.id, :format => :json
    end

    it 'has status 200 ' do
      expect(response.status).to eq(200)
    end

    it 'has a body' do
        expect(response.body).to_not be_empty
    end

  end

  describe "POST 'create'" do
    before(:each) { post :create, favorite_attrs}
    subject { response }

    its(:body)    { should_not be_empty }
    its(:status)  { should be 201 }
    its(:headers) { should include "Location" }

    context "with bad params" do
      before(:each) { post :create, bad_favorite_attrs }
      its(:body)    { should_not be_empty }
      pending 'returns status of 400, not 422.'
      # its(:status)  { should be 422 }
    end
  end

  context "existing favorite" do

    let!(:favorite)      { user.favorites.create!(:cut => cut) }
    let(:favorite_attrs) { { :id => favorite.id, :format => :json, :favorite => { :cut => cut } } }
    subject { response }

    describe "GET 'show'" do
      before(:each) { get :show, :id => favorite.id, :format => :json }

      its("body.strip")    { should_not be_empty }
      its(:status)  { should be 200}

      context "with an unknown favorite" do
        before(:each) { get :show, :id => 9999, :format => :json }

        its("body.strip") { should be_empty }
        its(:status)      { should be 404 }
      end
    end

    describe "PUT 'update'" do
      before(:each) { put :update, favorite_attrs }

      its("body.strip") { should be_empty }
      its(:status)      { should be 204 }

      it "updates the favorite" do
        pending 'the cut example does not have an id, needs fixing'
        expect(favorite.cut_id).to eq favorite_attrs[:favorite][:cut_id]
      end

      context "with bad params" do
        before(:each) { put :update, { :id => favorite.id, :favorite => { :cut_id => nil }, :format => :json } }

        its(:body)    { should_not be_empty }
        pending "returns a status of 400 instead of a 422"
        # its(:status)  { should be 422 }
      end
    end

    describe "DELETE 'destroy'" do
      before(:each) { delete :destroy, :id => favorite.id, :format => :json }

      its("body.strip") { should be_empty }
      its(:status)      { should be 204 }
    end
  end

end
