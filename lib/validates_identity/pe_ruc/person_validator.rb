# frozen_string_literal: true

class ValidatesIdentity
  module PeRuc
    class PersonValidator
      VALIDATION_REGULAR_EXPRESSION = /\A(10)([0-9]{8})([0-9]{1})\z/i.freeze

      attr_reader :value

      def initialize(value)
        @value = value.to_s
      end

      def valid?
        return true if value.blank?
        return false if value.length != 11
        return false if number.nil?

        verifier_digit == calculated_verifier_digit
      end

      def formatted
        value
      end

      private

      def result
        @result ||= VALIDATION_REGULAR_EXPRESSION.match(value)
      end

      def number
        return if result.nil?

        @number ||= "#{result[1]}#{result[2]}"
      end

      def verifier_digit
        return if result.nil?

        result[3]
      end

      def calculated_verifier_digit
        sum = multiply_and_sum([5, 4, 3, 2, 7, 6, 5, 4, 3, 2], number)
        result = 11 - (sum % 11)

        if result >= 10
          (result - 10).to_s
        else
          result.to_s
        end
      end

      def multiply_and_sum(array, number)
        multiplied = []
        number.scan(/\d{1}/).each_with_index { |e, i| multiplied[i] = e.to_i * array[i] }
        multiplied.inject { |s, e| s + e }
      end
    end
  end
end
