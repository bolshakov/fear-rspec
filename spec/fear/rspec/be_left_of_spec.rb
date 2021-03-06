RSpec.describe '#be_left_of' do
  include Fear::Either::Mixin

  let(:matcher) do
    be_left_of(1).tap { |m| m.matches?(1) }
  end

  it 'matches when actual is Left of expected' do
    expect(Left(1)).to be_left_of(1)
  end

  it 'does not match when actual in not a Left of expected' do
    expect(Left(1)).not_to be_left_of(2)
  end

  it 'does not match when actual is not a Left' do
    expect(1).not_to be_left_of(1)
  end

  it 'does not match when actual is Left' do
    expect(Right(1)).not_to be_left_of(1)
  end

  it 'is diffable' do
    expect(be_left_of(1)).to be_diffable
  end

  it 'describes itself' do
    expect(matcher.description).to eq('be Left of 1')
  end

  it 'provides failure message when negated' do
    expect(matcher.failure_message_when_negated).to eq "\nexpected: not Left of 1\n     got: 1\n"
  end

  it 'provides failure message' do
    expect(matcher.failure_message).to eq "\nexpected: Left of 1\n     got: 1\n"
  end
end
