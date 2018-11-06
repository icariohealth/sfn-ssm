# sfn-ssm

[![Maintainability](https://api.codeclimate.com/v1/badges/3083239924d072e687b7/maintainability)](https://codeclimate.com/github/novu/sfn-ssm/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/3083239924d072e687b7/test_coverage)](https://codeclimate.com/github/novu/sfn-ssm/test_coverage)

sfn-ssm is a parameter resolver used with Sparkleformation via sfn-parameters
(https://github.com/sparkleformation/sfn-parameters)

# Use

1. Install this Gem where you will run Sparkleformation CLI. 
2. Provide
AWS credentials following the normal AWS SDK for Ruby guidelines 
(https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/setup-config.html)
3. Update your `.sfn.rb` file to include `sfn-ssm` in the require array.
  ```ruby
  callbacks do
      require ['sfn-parameters', 'sfn-ssm']
      default ['parameters_stacks']
    end
  ```
4.Use the Sparkleformation CLI to perform the action you desire, parameters will be filled in via
Parameter Store as appropriate

# Use in parameter file

Using this resolver is as simple as including `parameter_store` as your key name and the name of
the path/value you want to lookup in Parameter Store in your sfn-parameters file.

```yaml
parameters:
  stack_creator:
    parameter_store: name_to_lookup
```

# Contributing

1. Create a new branch based on the develop branch unless you are patching against master. We build releases from master.
2. Make sure you have spec tests for any additions/changes
3. Submit a meaningful PR including use case, description, etc.

## Publishing a new release
1. Follow standard practice:
   * update the gem version
   * update the changelog
   * getting approvals (Novu)
2. Run spec tests and rubocop. Correct issues
3. Create a PR from develop to master. Master represents the last released code.
4. Run the `sfn-ssm-publisher` job when you wish to release
