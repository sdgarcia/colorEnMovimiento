require 'spec_helper'

describe "votes/new" do
  before(:each) do
    assign(:vote, stub_model(Vote,
      :email => "MyString",
      :city_id => 1,
      :other => "MyString"
    ).as_new_record)
  end

  it "renders new vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => votes_path, :method => "post" do
      assert_select "input#vote_email", :name => "vote[email]"
      assert_select "input#vote_city_id", :name => "vote[city_id]"
      assert_select "input#vote_other", :name => "vote[other]"
    end
  end
end
