require 'spec_helper'

describe Workspace do
  before { @workspace = Workspace.new(name: "Test", description: "Test") }
  subject { @workspace }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should be_valid }

  describe "name is empty" do
  	before { @workspace.name = " " }
  	it { should_not be_valid }
  end

  describe "name is too long" do
  	before { @workspace.name = "a" * 257 }
  	it { should_not be_valid }
  end

  describe "name at maximum length" do
  	before { @workspace.name = "a" * 256 }
  	it { should be_valid }
  end

  describe "description is empty" do
  	before { @workspace.description = " " }
  	it { should be_valid }
  end

  describe "description is too long" do
  	before { @workspace.description = "a" * 10001 }
  	it { should_not be_valid }
  end

  describe "description at maximum length" do
  	before { @workspace.description = "a" * 10000 }
  	it { should be_valid }
  end

  describe "adding a user" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      @workspace.save
      @workspace.user_workspace_relationships.create!(user_id: user.id)
    end

    it "should have the user linked to it" do
      @workspace.users.should == [user]
    end
  end
end
