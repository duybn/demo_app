require 'rails_helper'

describe SharedVideo do
  it do
    expect(subject).to belong_to :user
  end
end
