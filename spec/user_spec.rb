require 'spec_helper'

describe User do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:acct_type) }

  it { should validate_uniqueness_of(:username)}

  it { should have_many(:posts) }
  it { should have_many(:discussions) }

end
