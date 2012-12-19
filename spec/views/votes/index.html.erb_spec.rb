require 'spec_helper'

describe "votes/index" do
  before(:each) do
    assign(:votes, [
      stub_model(Vote,
        :email => "Email",
        :city_id => 1,
        :other => "Other"
      ),
      stub_model(Vote,
        :email => "Email",
        :city_id => 1,
        :other => "Other"
      )
    ])
  end

  it "renders a list of votes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Other".to_s, :count => 2
  end
end
