require 'spec_helper'

describe FileSecrets do
  
  before :each do
    ENV['FILE_SECRETS_BASE'] = nil
  end
  
  it "should read the value of a file relative to the base" do
    secrets = FileSecrets.new("spec/fixtures")
    expect(secrets.get("api/key")).to eq "key_value"
    expect(secrets.get("api/token")).to eq "token_value"
  end
  
  it "should return nil if the file doesn't exist" do
    secrets = FileSecrets.new("spec/fixtures")
    expect(secrets.get("foo")).to eq nil
  end
  
  it "should chomp any trailing line separators from the file" do
    secrets = FileSecrets.new("spec/fixtures")
    expect(secrets.get("trailing_line")).to eq "Trailing line"
  end
  
  it "should default to using the working directory as the base" do
    ENV['FILE_SECRETS_BASE'] = nil
    secrets = FileSecrets.new
    expect(secrets.get("spec/fixtures/api/key")).to eq "key_value"
  end
  
  it "should use the FILE_SECRETS_BASE environment variable as the base" do
    ENV['FILE_SECRETS_BASE'] = "spec"
    secrets = FileSecrets.new
    expect(secrets.get("fixtures/api/key")).to eq "key_value"
  end
  
  it "should be able to use [] instead of get" do
    secrets = FileSecrets.new("spec/fixtures")
    expect(secrets["api/key"]).to eq "key_value"
  end
  
  it "should be able to use class method helpers" do
    expect(FileSecrets.get("spec/fixtures/api/key")).to eq "key_value"
    expect(FileSecrets["spec/fixtures/api/key"]).to eq "key_value"
  end
  
end
