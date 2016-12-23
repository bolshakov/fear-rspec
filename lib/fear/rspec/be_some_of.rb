module Fear
  module RSpec
    # Passes if `actual` is Some and matches `expected`.
    #
    # @example
    #   expect(5).not_to   be_some_of(5)
    #   expect(Some(5)).to be_some_of(5)
    #   expect(None()).to  be_some_of(5)
    #
    ::RSpec::Matchers.define :be_some_of do |expected|
      match do |actual|
        actual.is_a?(Fear::Option) &&
          actual.any? do |value|
            expected = with_matchers_cloned(expected)
            ::RSpec::Support::FuzzyMatcher.values_match?(expected, value)
          end
      end

      failure_message_when_negated do |actual|
        format(
          "\nexpected: not Some of %<expected>s\n     got: %<actual>s\n",
          expected: ::RSpec::Support::ObjectFormatter.format(expected),
          actual: ::RSpec::Support::ObjectFormatter.format(actual),
        )
      end

      failure_message do |actual|
        format(
          "\nexpected: Some of %<expected>s\n     got: %<actual>s\n",
          expected: ::RSpec::Support::ObjectFormatter.format(expected),
          actual: ::RSpec::Support::ObjectFormatter.format(actual),
        )
      end

      description do
        "be Some of #{expected}"
      end

      diffable
    end
  end
end
