task default: %w[test]

task :test do
  Dir.glob('**/*_test.rb').each do |test_file|
    sh "tldr #{test_file}"
  end
end