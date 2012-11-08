# More info at https://github.com/guard/guard#readme
# Este archivo fue creado haciendo: guard init, 
# siguiendo los pasos del link

guard 'bundler' do
  watch('Gemfile')
end

guard 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

