module Fear
  module RSpec
    # Passes if `actual` is Left and matches `expected`.
    #
    # @example
    #   expect(5).not_to      be_failure_of (5)
    #   expect(Failure(5)).to be_failure_of (5)
    #
    ::RSpec::Matchers.define :be_failure_of do |expected|
      match do |actual|
        actual.is_a?(Fear::Failure) && begin
          expected = with_matchers_cloned(expected)
          ::RSpec::Support::FuzzyMatcher.values_match?(expected, actual.exception)
        end
      end

      failure_message_when_negated do |actual|
        format(
          "\nexpected: not Failure of %<expected>s\n     got: %<actual>s\n",
          expected: ::RSpec::Support::ObjectFormatter.format(expected),
          actual: ::RSpec::Support::ObjectFormatter.format(actual),
        )
      end

      failure_message do |actual|
        format(
          "\nexpected: Failure of %<expected>s\n     got: %<actual>s\n",
          expected: ::RSpec::Support::ObjectFormatter.format(expected),
          actual: ::RSpec::Support::ObjectFormatter.format(actual),
        )
      end

      description do
        "be Failure of #{expected}"
      end

      diffable
    end
  end
end
