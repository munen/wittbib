class BookSearch

  attr_accessor :authors, :title, :description, :isbn_10, :isbn_13, :language,
    :page_count, :published_date, :publisher

  def search(isbn)
    search_amazon(isbn)
    search_google(isbn)
  end

  def search_google(isbn)
    res = GoogleBooks.search("isbn:#{isbn}", {}).first
    return unless res
    own_accessors.each do |accessor|
      attribute = accessor.to_s[0..-2]
      self.send(accessor, res.send(attribute)) unless res.send(attribute).to_s.empty?
    end
  end

  def search_amazon(isbn)
    require 'multi_xml'

    params = { 'Operation' => 'ItemLookup',
      'ResponseGroup' => 'Large',
      'SearchIndex' => 'All',
      'IdType' => 'ISBN',
      'ItemId' => isbn }

    req = Vacuum.new.configure(YAML.load_file Rails.root.join('config', 'amazon_keys.yml'))

    begin
      res = req.get(query: params)

      res = MultiXml.parse(res.body).try(:[], "ItemLookupResponse").
        try(:[], "Items").
        try(:[], "Item")

      item = res.is_a?(Array) ? res[0] : res

      item = item.try(:[], "ItemAttributes")


      self.isbn_10 = item["ISBN"]                   if item["ISBN"]
      self.authors = item["Author"]                 if item["Author"]
      self.title = item["Title"]                    if item["Title"]
      self.description = item["Summary"]            if item["Summary"]
      self.language = item["Language"]              if item["Language"]
      self.page_count = item["NumberOfPages"]       if item["NumberOfPages"]
      self.published_date = item["PublicationDate"] if item["PublicationDate"]
      self.publisher = item["Publisher"]            if item["Publisher"]
    rescue Exception => e
      {}
      Rails.logger.error "Could not look up Amazon for ISBN #{isbn}: " + e.message
    end

  end

  def own_accessors
    self.methods.grep(/\w=$/)
  end

end
