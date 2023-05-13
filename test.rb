require_relative 'task'
require 'sqlite3'
DB = SQLite3::Database.new('tasks.db')
DB.results_as_hash = true

# CRUD

# Read all
# tasks = Task.all
# tasks.each do |task|
#   # 1. [ ] Complete Livecode - 	Implement CRUD on
#   status = task.done.positive? ? '[X]' : '[ ]'
#   puts "#{task.id}. #{status} #{task.title} - #{task.description}"
# end

# Read one
# task = Task.find(1)
# p task

# Create
# task = Task.new(title: 'Review flashcards', description: 'OOP and CRUD with SQL')
# task.save

# Update
# task = Task.find(2)
# task.done += 1
# task.save

# Destroy
task = Task.find(2)
task.destroy

tasks = Task.all
tasks.each do |task|
  # 1. [ ] Complete Livecode - 	Implement CRUD on
  status = task.done.positive? ? '[X]' : '[ ]'
  puts "#{task.id}. #{status} #{task.title} - #{task.description}"
end
