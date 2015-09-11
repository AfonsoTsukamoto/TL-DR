class Summarizer
  API_ROOT = 'http://localhost:5000'.freeze
  class << self
    def fetch_summary(text)
      t = new(text: text)
      response = t.convert
      response = JSON.parse(response.body)

      response ? response['summary'] : nil
    end

    def client
      @client ||= ::Faraday.new(url: API_ROOT) do |cl|
        cl.response :logger
        cl.adapter :net_http
      end
    end
  end

  attr_reader :client

  def initialize(text:)
    @text = text
    @client = self.class.client
  end

  def payload
    @payload ||= {
      content: @text
    }.to_json
  end

  def convert
    @converted ||= client.post do |request|
      request.url '/summarizer'
      request.headers['Content-Type']  = 'application/json'
      request.body = payload
      request.options.timeout = 120
      request.options.open_timeout = 120
    end
  end
end