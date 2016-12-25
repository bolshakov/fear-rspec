module Fear
  module RSpec
    # Passes if `actual` is Success and matches `expected`.
    #
    # @example
    #   expect(5).not_to      be_success_of(5)
    #   expect(Success(5)).to be_success_of(5)
    #
    ::RSpec::Matchers.define :be_success_of do |expected|
      match do |actual|
        actual.is_a?(Fear::Try) &&
          actual.any? do |value|
            expected = with_matchers_cloned(expected)
            ::RSpec::Support::FuzzyMatcher.values_match?(expected, value)
          end
      end

      failure_message_when_negated do |actual|
        format(
          "\nexpected: not Success of %<expected>s\n     got: %<actual>s\n",
          expected: ::RSpec::Support::ObjectFormatter.format(expected),
          actual: ::RSpec::Support::ObjectFormatter.format(actual),
        )
      end

      failure_message do |actual|
        format(
          "\nexpected: Success of %<expected>s\n     got: %<actual>s\n",
          expected: ::RSpec::Support::ObjectFormatter.format(expected),
          actual: ::RSpec::Support::ObjectFormatter.format(actual),
        )
      end

      description do
        "be Success of #{expected}"
      end

      diffable
    end
  end
end
