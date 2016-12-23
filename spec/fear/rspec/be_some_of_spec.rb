RSpec.describe '#be_some_of' do
  include Fear::Option::Mixin

  let(:matcher) do
    be_some_of(1).tap { |m| m.matches?(1) }
  end

  it 'matches when actual is some of expected' do
    expect(Some(1)).to be_some_of(1)
  end

  it 'does not match when actual is not a some of expected' do
    expect(Some(1)).not_to be_some_of(2)
  end

  it 'does not match when actual is not a Some' do
    expect(1).not_to be_some_of(1)
  end

  it 'does not match when actual is None' do
    expect(None()).not_to be_some_of(1)
  end

  it 'is diffable' do
    expect(be_some_of(1)).to be_diffable
  end

  it 'describes itself' do
    expect(matcher.description).to eq('be Some of 1')
  end

  it 'provides failure message when negated' do
    expect(matcher.failure_message_when_negated).to eq "\nexpected: not Some of 1\n     got: 1\n"
  end

  it 'provides failure message' do
    expect(matcher.failure_message).to eq "\nexpected: Some of 1\n     got: 1\n"
  end
end
