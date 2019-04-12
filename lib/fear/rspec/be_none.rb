module Fear
  module RSpec
    # Passes if `actual` is Some and matches `expected`.
    #
    # @example
    #   expect(5).not_to   be_some_of(5)
    #   expect(Some(5)).to be_some_of(5)
    #   expect(None()).to  be_some_of(5)
    #
    ::RSpec::Matchers.define :be_none do
      match do |actual|
        actual == Fear::None
      end

      failure_message_when_negated do |actual|
        format(
          "\nexpected: not None\n     got: %<actual>s\n",
          actual: ::RSpec::Support::ObjectFormatter.format(actual),
        )
      end

      failure_message do |actual|
        format(
          "\nexpected: None\n     got: %<actual>s\n",
          actual: ::RSpec::Support::ObjectFormatter.format(actual),
        )
      end

      description do
        'be None'
      end

      diffable
    end
  end
end
