require 'aws-sdk-ssm'
require 'sfn-parameters'

module SfnSSM
  class ParameterStore < SfnParameters::Resolver
    def setup
      # nothing currently
    end

    def resolve(value)
      begin
        resp = ssm.get_parameter(
          name: value,
          with_decryption: true
        )
      rescue Aws::SSM::Errors::ParameterNotFound
        raise "Unable to find '#{value}' in Parameter Store"
      end
      resp.parameter.value
    end

    private

    def ssm
      @ssm ||= Aws::SSM::Client.new
    end
  end
end
