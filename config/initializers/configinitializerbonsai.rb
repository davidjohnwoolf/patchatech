Elasticsearch::Model.client = Elasticsearch::Client.new log: true, host: ENV['BONSAI_URL']
