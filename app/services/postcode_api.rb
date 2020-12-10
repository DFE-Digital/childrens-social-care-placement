class PostcodeApi
  RETRY_EXCEPTIONS = [::Faraday::ConnectionFailed].freeze
  RETRY_OPTIONS = {
    max: 2,
    methods: %i[get],
    exceptions: ::Faraday::Request::Retry::DEFAULT_EXCEPTIONS + RETRY_EXCEPTIONS,
  }.freeze

  def initialize(postcode)
    @postcode = postcode
  end

  def postcode_valid?
    response = faraday.get("http://postcodes.io/postcodes/#{@postcode}/validate")
    # connection error caught in application controller
    response.body["result"]
  end

private

  def faraday
    Faraday.new do |f|
      f.use :http_cache, store: Rails.cache
      f.response :json
      f.request :retry, RETRY_OPTIONS
    end
  end
end
