require 'uri'
require 'net/http'

class TrafficCopClient
  attr_accessor :attributes

  def initialize(url, jwt_token)
    @token = jwt_token
    @url = url
    @response = ''
    @attributes ||= %i[Author
                       Title
                       PublicationDate
                       Publisher
                       PublicationDate
                       Price
                       Genre
                       ISBN] # attribute names should match how they're cased/defined on the GraphQL service.
  end

  def get_book(isbn, attributes = nil)
    attributes ||= @attributes # if no attributes, we assume they want all attributes back from the GraphQL service.

    query_name = 'getBook' # needs to correlate to the query name on your GraphQL service.
    @body = { query: "{#{query_name}(ISBN: \"#{isbn}\"){}}" }

    results = query_with_attributes(attributes)
    results[query_name]
  end

  def get_all_books(*attributes)
    attributes = @attributes if attributes.empty?
    query_name = 'listBooks'
    @body = { query: "{#{query_name}(limit: 500){items{}}}" } # For very large calls this logic will need to be refactored for pagination.

    results = query_with_attributes(attributes)
    results[query_name]['items']
  end

  private

  def query_with_attributes(attributes)
    url = URI.parse(@url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = parse_request(url)
    request.body = parse_query(attributes)

    response = http.request(request)
    @response = response.read_body # for crazy large responses this may also want to be refactored to write to disk instead of staying in memory.
    JSON.parse(@response)['data']
  end

  def parse_request(url)
    request = Net::HTTP::Post.new(url.request_uri)
    request['Accept'] = 'application/json'
    request['authorization'] = @token # AppSync does not have you append "Bearer " to the front of your token.
    request
  end

  def parse_query(attributes)
    parsed_query = @body
    parsed_query[:query] = @body[:query].gsub('{}', "{#{attributes.join(' ').strip}}")
    parsed_query.to_json
  end
end