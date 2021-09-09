# typed: strict
# frozen_string_literal: true

# This class add the option to authenticate with api_key
Warden::Strategies.add(:api_key, ApiKeyStrategy)
