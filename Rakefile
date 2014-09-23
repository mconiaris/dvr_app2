require 'pry'


namespace :greetings do
  desc "Prints thank you"
  task :thank_you do
    puts "Thank you"
  end
  task :default => [:thank_you]
end

desc "Says Hello, I'm the default task."
task :default do
  puts "Hello, I'm the default task."
end

desc "Takes a name argument to greet someone."
task :hi, [:name] do |cmd, args|
  puts "Hi #{args[:name]}"
end


namespace :cake do

  desc "Bake a Cake"
  task :bake => [:mix_up, :go_to_store] do
    puts "Cake is baked"
  end

  task :mix_up => [:add_flower, :add_eggs] do
    puts "Mix up ingredients"
  end

  task :add_flower => :get_flower do
    puts "Adding flower"
  end

  task :add_eggs => :go_to_store do
    puts "Adding Eggs"
  end

  task :get_flower => :go_to_store do
    puts "Get Flower"
  end

  task :go_to_store do
    puts "Go to Store"
  end
end


namespace :dozer do
  desc "print ENV"
  task :env do
    # executed in bash shell
    sh("ENV")
  end

  desc "print PWD"
  task :pwd do
    # both do the same
    sh("pwd")
    system("pwd")
  end

  desc "adds views for a resource"
  task :make_views, [:resource_name] do |cmd, args|
    resource = args[:resource_name]
    sh("mkdir views/#{resource}")
    sh("touch views/#{resource}/index.erb")
    FileUtils.touch("views/#{resource}/new.erb")
    # we can call touch directly because we included fileutils
    touch("views/#{resource}/edit.erb")
    touch("views/#{resource}/show.erb")
  end
end

desc "creates a db"
  task :create, [:dbname] do |cmd, args|
    sh("createdb #{args[:dbname]}")
  end



namespace :bundler do
  task :setup do
    require 'rubygems'
    require 'bundler'
  end
end

task :environment, [:env] => 'bundler:setup' do |cmd, args|
  ENV["RACK_ENV"] = args[:env] || "development"
  Bundler.require(:default, ENV["RACK_ENV"])
  require "./config/boot"
end
