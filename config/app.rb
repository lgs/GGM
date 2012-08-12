#this should live in a file called app.rb inside a directory called 'config'

environment :development do
  config['mongo'] = EventMachine::Synchrony::ConnectionPool.new(size: 20) do
    conn = EM::Mongo::Connection.new('localhost', 27017, 1, {:reconnect_in => 1})
   conn.db('db')
  end
end

environment :production do
  config['mongo'] = EventMachine::Synchrony::ConnectionPool.new(size: 20) do
    mongolab = URI.parse(ENV['MONGOLAB_URI'])
    conn = EM::Mongo::Connection.new mongolab.host, mongolab.port, 1, {:reconnect_in => 1}

    db = conn.db mongolab.path.gsub(/^\//, '')
    db.authenticate mongolab.user, mongolab.password
    db
  end
end

