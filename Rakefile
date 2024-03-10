task default: %w[test]

task :test do
  Dir.glob('**/*_test.rb').each do |test_file|
    sh "ruby #{test_file}"
  end
end