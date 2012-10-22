require 'spec_helper'

describe WorkspaceTaskRelationship do
  let(:workspace) { FactoryGirl.create(:workspace) }
  let(:task) { FactoryGirl.create(:task) }

  before { @wtr = WorkspaceTaskRelationship.new(workspace_id: workspace.id, task_id: task.id) }
  subject { @wtr }

  it { should respond_to(:workspace) }
  it { should respond_to(:task) }
  it { should be_valid }

  describe "when workspace is not assigned" do
  	before { @wtr.workspace = nil }
  	it { should_not be_valid }
  end

  describe "when task is not assigned" do
  	before { @wtr.task = nil }
  	it { should_not be_valid }
  end
end
