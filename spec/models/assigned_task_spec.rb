require 'spec_helper'

describe AssignedTask do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:task) { FactoryGirl.create(:task) }

  before do 
    @at = AssignedTask.new
    @at.user = user
    @at.task = task
  end

  subject { @at }

  it { should respond_to(:user) }
  it { should respond_to(:task) }
  it { should be_valid }

  describe "when user is not assigned" do
  	before { @at.user_id = nil }
  	it { should_not be_valid }
  end

  describe "when task is not assigned" do
  	before { @at.task_id = nil }
  	it { should_not be_valid }
  end
end
