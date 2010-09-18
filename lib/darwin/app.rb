require 'sinatra/base'
require 'resque'
require 'haml'

module Finch
  class App < Sinatra::Base
    get '/' do
      @chromosomes = Finch::Chromosome.all.order_by([[:deceased, :asc], [:fitness, :desc]])
      haml :index
    end

    post '/' do
      Resque.enqueue(Job, params)
      redirect "/"
    end

    post '/failing' do
      Resque.enqueue(FailingJob, params)
      redirect "/"
    end
  end
end
