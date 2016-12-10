module Fear
  module RSpec
    # Passes if `actual` is Right and matches `expected`.
    #
    # @example
    #   expect(5).not_to    be_right_of(5)
    #   expect(Right(5)).to be_right_of(5)
    #
    ::RSpec::Matchers.define :be_right_of do |expected|
      match do |actual|
        actual.is_a?(Fear::Either) &&
          actual.any? do |value|
            expected = with_matchers_cloned(expected)
            ::RSpec::Support::FuzzyMatcher.values_match?(expected, value)
          end
      end

      failure_message_when_negated do |actual|
        format(
          "\nexpected: not Right of %<expected>s\n     got: %<actual>s\n",
          expected: ::RSpec::Support::ObjectFormatter.format(expected),
          actual: ::RSpec::Support::ObjectFormatter.format(actual),
        )
      end

      failure_message do |actual|
        format(
          "\nexpected: Right of %<expected>s\n     got: %<actual>s\n",
          expected: ::RSpec::Support::ObjectFormatter.format(expected),
          actual: ::RSpec::Support::ObjectFormatter.format(actual),
        )
      end

      description do
        "be Right of #{expected}"
      end

      diffable
    end
  end
end
