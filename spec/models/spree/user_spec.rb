require 'spec_helper'

module Spree
  describe LegacyUser do
    let(:user) { Spree.user_class.create(:email => "foo@bar.com", :password => "secret", :password_confirmation => "secret") }

    context "store_credits_total" do
      before do
        user.store_credits.create(:amount => 100, :remaining_amount => 100, :reason => "A")
        user.store_credits.create(:amount => 60, :remaining_amount => 55, :reason => "B")
      end

      it "should return the total remaining amount for users store credits" do
        user.store_credits_total.should == 155.00
      end
    end
  end
end
