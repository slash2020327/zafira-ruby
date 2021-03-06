# frozen_string_literal: true

module Zafira
  class Client
    attr_accessor :environment, :run_owner, :test_suite_owner,
                  :test_suite, :job, :run, :current_test_case, :unavailable

    def initialize(config)
      self.config = config
    end

    def test_case_handler_class
      return unless config.respond_to?(:test_case_handler_class)
      config.test_case_handler_class
    end

    def failed_test_case_handler_class
      return unless config.respond_to?(:failed_test_case_handler_class)
      config.failed_test_case_handler_class
    end

    def skipped_test_case_handler_class
      return unless config.respond_to?(:skipped_test_case_handler_class)
      config.skipped_test_case_handler_class
    end

    def passed_test_case_handler_class
      return unless config.respond_to?(:passed_test_case_handler_class)
      config.passed_test_case_handler_class
    end

    def zafira_test_case_handler_class
      config&.zafira_test_case_handler_class
    end

    def zafira_failed_test_case_handler_class
      config&.zafira_failed_test_case_handler_class
    end

    def zafira_skipped_test_case_handler_class
      config&.zafira_skipped_test_case_handler_class
    end

    def zafira_passed_test_case_handler_class
      config&.zafira_passed_test_case_handler_class
    end

    def enabled?
      # enabled if environment not set yet
      # or it's enabled by the var zafira_enabled
      environment&.zafira_enabled || !environment
    end

    def disabled?
      !enabled?
    end

    private

    attr_accessor :config
  end
end
