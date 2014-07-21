Elasticsearch::Model.client = Elasticsearch::Client.new logs: true, url: ENV['BONSAI_URL']
