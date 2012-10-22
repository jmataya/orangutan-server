require 'spec_helper'

describe UserWorkspaceRelationship do
  let(:user) { FactoryGirl.create(:user) }
  let(:workspace) { FactoryGirl.create(:workspace) }

  before do
  	@uwr = UserWorkspaceRelationship.new
  	@uwr.user = user
  	@uwr.workspace = workspace
  end

  subject { @uwr }

  it { should respond_to(:user) }
  it { should respond_to(:workspace) }
  it { should be_valid }

  describe "when user is not specified" do
  	before { @uwr.user = nil }
  	it { should_not be_valid }
  end

  describe "when workspace is not specified" do
  	before { @uwr.workspace = nil }
  	it { should_not be_valid }
  end
end
