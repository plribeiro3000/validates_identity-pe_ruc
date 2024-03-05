# frozen_string_literal: true

require 'validates_identity'
require_relative 'pe_ruc/version'

class ValidatesIdentity
  module PeRuc
    autoload :LegalValidator, 'validates_identity/pe_ruc/legal_validator'
    autoload :PersonValidator, 'validates_identity/pe_ruc/person_validator'
  end
end

# Legal
ValidatesIdentity.register_legal_identity_type('PE_RUC_LEGAL', ValidatesIdentity::PeRuc::LegalValidator)
ValidatesIdentity::ShouldaMatchers.register_legal_allowed_values('PE_RUC_LEGAL', %w[20601313490])
ValidatesIdentity::ShouldaMatchers.register_legal_disallowed_values('PE_RUC_LEGAL', %w[20601313491])
# Person
ValidatesIdentity.register_person_identity_type('PE_RUC_PERSON', ValidatesIdentity::PeRuc::PersonValidator)
ValidatesIdentity::ShouldaMatchers.register_person_allowed_values('PE_RUC_PERSON', %w[10123456781])
ValidatesIdentity::ShouldaMatchers.register_person_disallowed_values('PE_RUC_PERSON', %w[10123456780])
