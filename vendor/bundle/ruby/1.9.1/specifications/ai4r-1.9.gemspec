# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ai4r}
  s.version = "1.9"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["Sergio Fierens"]
  s.cert_chain = nil
  s.date = %q{2009-06-30}
  s.email = %q{sergio@jadeferret.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["examples/classifiers", "examples/classifiers/id3_data.csv", "examples/classifiers/id3_example.rb", "examples/classifiers/naive_bayes_data.csv", "examples/classifiers/naive_bayes_example.rb", "examples/classifiers/results.txt", "examples/clusterers", "examples/genetic_algorithm", "examples/genetic_algorithm/genetic_algorithm_example.rb", "examples/genetic_algorithm/travel_cost.csv", "examples/neural_network", "examples/neural_network/backpropagation_example.rb", "examples/neural_network/patterns_with_base_noise.rb", "examples/neural_network/patterns_with_noise.rb", "examples/neural_network/training_patterns.rb", "examples/neural_network/xor_example.rb", "examples/som", "examples/som/som_data.rb", "examples/som/som_multi_node_example.rb", "examples/som/som_single_example.rb", "lib/ai4r", "lib/ai4r/classifiers", "lib/ai4r/classifiers/classifier.rb", "lib/ai4r/classifiers/hyperpipes.rb", "lib/ai4r/classifiers/id3.rb", "lib/ai4r/classifiers/multilayer_perceptron.rb", "lib/ai4r/classifiers/naive_bayes.rb", "lib/ai4r/classifiers/one_r.rb", "lib/ai4r/classifiers/prism.rb", "lib/ai4r/classifiers/zero_r.rb", "lib/ai4r/clusterers", "lib/ai4r/clusterers/average_linkage.rb", "lib/ai4r/clusterers/bisecting_k_means.rb", "lib/ai4r/clusterers/centroid_linkage.rb", "lib/ai4r/clusterers/clusterer.rb", "lib/ai4r/clusterers/complete_linkage.rb", "lib/ai4r/clusterers/diana.rb", "lib/ai4r/clusterers/k_means.rb", "lib/ai4r/clusterers/median_linkage.rb", "lib/ai4r/clusterers/single_linkage.rb", "lib/ai4r/clusterers/ward_linkage.rb", "lib/ai4r/clusterers/weighted_average_linkage.rb", "lib/ai4r/data", "lib/ai4r/data/data_set.rb", "lib/ai4r/data/parameterizable.rb", "lib/ai4r/data/proximity.rb", "lib/ai4r/data/statistics.rb", "lib/ai4r/experiment", "lib/ai4r/experiment/classifier_evaluator.rb", "lib/ai4r/genetic_algorithm", "lib/ai4r/genetic_algorithm/genetic_algorithm.rb", "lib/ai4r/neural_network", "lib/ai4r/neural_network/backpropagation.rb", "lib/ai4r/neural_network/hopfield.rb", "lib/ai4r/som", "lib/ai4r/som/layer.rb", "lib/ai4r/som/node.rb", "lib/ai4r/som/som.rb", "lib/ai4r/som/two_phase_layer.rb", "lib/ai4r.rb", "README.rdoc", "test/classifiers/hyperpipes_test.rb", "test/classifiers/id3_test.rb", "test/classifiers/multilayer_perceptron_test.rb", "test/classifiers/naive_bayes_test.rb", "test/classifiers/one_r_test.rb", "test/classifiers/prism_test.rb", "test/classifiers/zero_r_test.rb", "test/clusterers/average_linkage_test.rb", "test/clusterers/bisecting_k_means_test.rb", "test/clusterers/centroid_linkage_test.rb", "test/clusterers/complete_linkage_test.rb", "test/clusterers/diana_test.rb", "test/clusterers/k_means_test.rb", "test/clusterers/median_linkage_test.rb", "test/clusterers/single_linkage_test.rb", "test/clusterers/ward_linkage_test.rb", "test/clusterers/weighted_average_linkage_test.rb", "test/data/data_set_test.rb", "test/data/proximity_test.rb", "test/data/statistics_test.rb", "test/experiment/classifier_evaluator_test.rb", "test/genetic_algorithm/chromosome_test.rb", "test/genetic_algorithm/genetic_algorithm_test.rb", "test/neural_network/backpropagation_test.rb", "test/neural_network/hopfield_test.rb", "test/som/som_test.rb"]
  s.homepage = %q{http://ai4r.rubyforge.org}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubyforge_project = %q{ai4r}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby implementations of algorithms covering several Artificial intelligence fields, including Genetic algorithms, Neural Networks, machine learning, and clustering.}
  s.test_files = ["test/classifiers/hyperpipes_test.rb", "test/classifiers/id3_test.rb", "test/classifiers/multilayer_perceptron_test.rb", "test/classifiers/naive_bayes_test.rb", "test/classifiers/one_r_test.rb", "test/classifiers/prism_test.rb", "test/classifiers/zero_r_test.rb", "test/clusterers/average_linkage_test.rb", "test/clusterers/bisecting_k_means_test.rb", "test/clusterers/centroid_linkage_test.rb", "test/clusterers/complete_linkage_test.rb", "test/clusterers/diana_test.rb", "test/clusterers/k_means_test.rb", "test/clusterers/median_linkage_test.rb", "test/clusterers/single_linkage_test.rb", "test/clusterers/ward_linkage_test.rb", "test/clusterers/weighted_average_linkage_test.rb", "test/data/data_set_test.rb", "test/data/proximity_test.rb", "test/data/statistics_test.rb", "test/experiment/classifier_evaluator_test.rb", "test/genetic_algorithm/chromosome_test.rb", "test/genetic_algorithm/genetic_algorithm_test.rb", "test/neural_network/backpropagation_test.rb", "test/neural_network/hopfield_test.rb", "test/som/som_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 1

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
