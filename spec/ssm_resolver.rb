require 'sfn-ssm'

RSpec.describe SfnSSM::ParameterStore do
  stub_client = Aws::SSM::Client.new(stub_responses: true)
  stub_client.stub_responses(:get_parameter,
                             { parameter:
                               {
                                 name: '/foo/bar/baz',
                                 value: 'value1',
                                 type: 'SecureString'
                               } },
                             'ParameterNotFound')
  let(:stub_client) { stub_client }

  describe '#resolve' do
    it 'should return a value' do
      expect(Aws::SSM::Client).to receive(:new).and_return(stub_client)
      expect(described_class.new(nil).resolve('/foo/bar/baz')).to eql('value1')
    end
    it 'should log an error' do
      expect(Aws::SSM::Client).to receive(:new).and_return(stub_client)
      expect { described_class.new(nil).resolve('/idont/exist') }.to raise_error(
        RuntimeError, "Unable to find '/idont/exist' in Parameter Store"
      )
    end
  end
end
