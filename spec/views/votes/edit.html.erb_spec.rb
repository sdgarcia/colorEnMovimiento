require 'spec_helper'

describe "votes/edit" do
  before(:each) do
    @vote = assign(:vote, stub_model(Vote,
      :email => "MyString",
      :city_id => 1,
      :other => "MyString"
    ))
  end

  it "renders the edit vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => votes_path(@vote), :method => "post" do
      assert_select "input#vote_email", :name => "vote[email]"
      assert_select "input#vote_city_id", :name => "vote[city_id]"
      assert_select "input#vote_other", :name => "vote[other]"
    end
  end
end
