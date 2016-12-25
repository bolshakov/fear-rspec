RSpec.describe '#be_failure_of' do
  include Fear::Try::Mixin

  let(:matcher) do
    be_failure_of(1).tap { |m| m.matches?(1) }
  end

  it 'matches when actual is Failure of expected' do
    expect(Failure(ArgumentError)).to be_failure_of(ArgumentError)
  end

  it 'does not match when actual in not a Failure of expected' do
    expect(Failure(ArgumentError)).not_to be_failure_of(2)
  end

  it 'does not match when actual is not a Failure' do
    expect(1).not_to be_failure_of(1)
  end

  it 'does not match when actual is Left' do
    expect(Success(1)).not_to be_failure_of(1)
  end

  it 'is diffable' do
    expect(be_left_of(1)).to be_diffable
  end

  it 'describes itself' do
    expect(matcher.description).to eq('be Failure of 1')
  end

  it 'provides failure message when negated' do
    expect(matcher.failure_message_when_negated).to eq "\nexpected: not Failure of 1\n     got: 1\n"
  end

  it 'provides failure message' do
    expect(matcher.failure_message).to eq "\nexpected: Failure of 1\n     got: 1\n"
  end
end
