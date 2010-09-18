require 'resque/tasks'

task :evolve do
  search = Ai4r::GeneticAlgorithm::GeneticSearch.new(2, 3)
  result = search.run
  puts result.inspect
  puts result.data
end

task :seed do
  Finch::Chromosome.delete_all
  search = Ai4r::GeneticAlgorithm::DistributedGeneticSearch.new
  search.generate_initial_population(100)
end

task :recalculate_fitness do
  Finch::Chromosome.alive.each do |c|
    c.queue_fitness_calculations
  end
end
task :check_generation do
  if Resque.size("games") == 0
    # All games complete for this generation.
    Finch::Chromosome.alive.without_calculated_fitness.each do |c|
      c.queue_fitness_calculations
    end

    if Finch::Chromosome.alive.without_calculated_fitness.length == 0
      # All fitness calculations are complete! Do the next generation
      search = Ai4r::GeneticAlgorithm::DistributedGeneticSearch.new
      search.advance_generation
      search.evaluate_generation
    end
  else
    return
  end
end

desc "Restart Resque workers"
task :kill_workers do
  pids = Resque.workers.map do |worker|
    worker.worker_pids
  end.flatten.uniq

  system("kill -n 3 #{pids.join(' ')}")
end

task :retry_failed do
  # Requeue all jobs in the failed queue
  (Resque::Failure.count-1).downto(0).each { |i| Resque::Failure.requeue(i) }

  # Clear the failed queue
  Resque::Failure.clear
end