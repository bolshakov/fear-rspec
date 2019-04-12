RSpec.describe '#be_none' do
  include Fear::Option::Mixin

  let(:matcher) { be_none.tap { |m| m.matches?(Some(1)) } }

  it 'matches Fear::None' do
    expect(None()).to be_none
  end

  it 'does not match Fear::Some' do
    expect(Some(1)).not_to be_none
  end

  it 'does not match when actual is not a Fear::Option' do
    expect(1).not_to be_none
  end

  it 'is diffable' do
    expect(be_none).to be_diffable
  end

  it 'describes itself' do
    expect(matcher.description).to eq('be None')
  end

  it 'provides failure message when negated' do
    expect(matcher.failure_message_when_negated).to eq "\nexpected: not None\n     got: #<Fear::Some get=1>\n"
  end

  it 'provides failure message' do
    expect(matcher.failure_message).to eq "\nexpected: None\n     got: #<Fear::Some get=1>\n"
  end
end
