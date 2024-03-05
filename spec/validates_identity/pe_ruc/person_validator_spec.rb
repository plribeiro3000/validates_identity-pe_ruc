# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ValidatesIdentity::PeRuc::PersonValidator do
  it 'accepts 10601313494' do
    expect(described_class.new('10601313494')).to be_valid
  end

  it 'accepts 10754821235' do
    expect(described_class.new('10754821235')).to be_valid
  end

  it 'accepts 10186563129' do
    expect(described_class.new('10186563129')).to be_valid
  end

  it 'rejects 20601313490' do
    expect(described_class.new('20601313490')).not_to be_valid
  end

  it 'rejects 20754821231' do
    expect(described_class.new('20754821231')).not_to be_valid
  end

  it 'rejects 20186563124' do
    expect(described_class.new('20186563124')).not_to be_valid
  end

  it 'rejects 20601313491' do
    expect(described_class.new('20601313491')).not_to be_valid
  end

  it 'rejects 10-01-23-123' do
    expect(described_class.new('10-01-23-123')).not_to be_valid
  end

  it 'rejects AA-123-123' do
    expect(described_class.new('AA-123-123')).not_to be_valid
  end

  it 'rejects 1-1' do
    expect(described_class.new('1-1')).not_to be_valid
  end

  it 'rejects 0-12-12' do
    expect(described_class.new('0-12-12')).not_to be_valid
  end

  it 'rejects 1-0-1' do
    expect(described_class.new('1-0-1')).not_to be_valid
  end

  it 'rejects 1-0' do
    expect(described_class.new('1-0')).not_to be_valid
  end

  it 'rejects A' do
    expect(described_class.new('A')).not_to be_valid
  end

  it 'accepts blank string' do
    expect(described_class.new('')).to be_valid
  end

  it 'accepts nil' do
    expect(described_class.new(nil)).to be_valid
  end
end
