Elasticsearch::Model.client = Elasticsearch::Client.new logs: true, host: ENV['BONSAI_URL']
