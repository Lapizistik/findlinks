require "findlinks/version"
require 'nokogiri'

module Findlinks
  LINKFILE = File.expand_path("../../data/link-elements.yaml", __FILE__)

  def self.from_file(filename)
    File.open(filename) { |f| Document.new(Nokogiri.HTML(f)).links }
  end

  def self.urls_from_file(filename, absolute: false)
    from_file(filename).map { |l| l.url(absolute) }.sort.uniq
  end

end

require "findlinks/link"
require "findlinks/document"
