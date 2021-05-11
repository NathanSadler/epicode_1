#!/usr/bin/env ruby
require 'fileutils'


base_directory = FileUtils.pwd()
print(base_directory)

#Create and enter root directory of project
project_name = ARGV[0]
FileUtils.mkdir(project_name)
FileUtils.cd("#{base_directory}/#{project_name}")

# Add some project files
FileUtils.mkdir("lib")
FileUtils.mkdir("spec")
FileUtils.touch("Gemfile")

# Get names of classes to be used in the project
class_names = []
while TRUE
  print("Enter the name of the next class to add to the project, or just" +
  "press enter without typing anything to finish:")
  next_class = STDIN.gets.chomp
  if next_class != ""
    class_names.push(next_class)
  else
    break
  end
end

# Add files for each class that got entered, and add their classes/specs
class_names.each do |class_name|
  class_file = "lib/#{class_name.downcase}.rb"
  spec_file = "spec/#{class_name.downcase}_spec.rb"
  FileUtils.touch(class_file)
  FileUtils.touch(spec_file)
  file = File.open(class_file, 'w')
  file.puts("class #{class_name.capitalize}")
  file.puts("end")
  file.close
  file = File.open(spec_file, 'w')
  file.puts("require '#{class_name.downcase}'")
  file.puts("require 'rspec'\n")
  file.puts("describe('#{class_name.capitalize}') do")
  file.puts("end")
  file.close
end

# Add gems to gemfile
file = File.open('Gemfile', 'w')
file.puts("source 'https://rubygems.org'\n")
file.puts("gem 'rspec'")
file.puts("gem 'pry'")
file.close

# Installs gems
system('bundle install')
