require 'spec_helper'

describe Task do
  before { @task = Task.new(title: "Test task") }
  subject { @task }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:due_date) }
  it { should respond_to(:completed) }

  it { should be_valid }
  it { should_not be_completed }

  describe "when title is not set" do
  	before { @task.title = " " }
  	it { should_not be_valid }
  end

  describe "when title is too long" do
  	before { @task.title = "a" * 257 }
  	it { should_not be_valid }
  end

  describe "when title is at the maximum length" do
  	before { @task.title = "a" * 256 }
  	it { should be_valid }
  end

  describe "when description is not set" do
  	before { @task.description = " " }
  	it { should be_valid }
  end

  describe "when description is too long" do
  	before { @task.description = "a" * 10001 }
  	it { should_not be_valid }
  end

  describe "when description is at the maximum length" do
  	before { @task.description = "a" * 10000 }
  	it { should be_valid }
  end
end
