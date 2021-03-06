workers Integer(ENV["WEB_CONCURRENCY"] || 3)
threads_count = Integer(ENV["RAILS_MAX_THREADS"] || 5)
threads threads_count, threads_count

preload_app!

rackup DefaultRackup
port ENV["PORT"] || 3000
environment ENV["RACK_ENV"] || "production"

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
