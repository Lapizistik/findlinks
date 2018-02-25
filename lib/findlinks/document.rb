# -*- coding: utf-8 -*-
require 'yaml'

# TODO: use base url!


module Findlinks
  class Document
    # @param doc [Nokogiri::HTML::Document] Nokogiri document
    def initialize(doc)
      @doc = doc
    end
    
    def links(include: ['html5'])
      each_raw_link(include: include).to_a
    end
    
    def each_raw_link(include: ['html5'])
      return enum_for(__method__) unless block_given?
      
      patterns = YAML.load_file(LINKFILE)
      
      # structure of pattern is:
      # { "html5" =>    [
      #                   ['a',   'href'],
      #                   …
      #                   ['img', 'src'],
      #                   ['img', 'srcset', /(?:^|, *)[^, ]+/],
      #                   …
      #                 ],
      #   "obsolete" => [ … ] }
      # with [tag, attribute, regexp].
      # If regexp is present it is used to scan url(s) from the attribute value
      
      include.each do |key|
        patterns[key].each do |tag, attr, regexp|
          @doc.xpath("//#{tag}[@#{attr}]").each do |element|
            value = element[attr]
            
            next unless value  # should not happen on well-formed html
            
            # urls may be surrounded by whitespace (see w3 spec)
            value.strip!
            
            next if value.empty?   # we ignore empty urls
            
            # Attribute values (e.g. srcset) may consist of one or more urls
            # together with additional characters. If a regexp is provided
            # we use it to scan the urls from the value.
            if(regexp)
              urls = value.match(regexp).to_a
              urls.each do
                yield Link.new(url: url, node: element.attribute(attr))
              end
            else
              yield Link.new(url: value, node: element.attribute(attr))
            end              
          end
        end
      end
    end
  end
end    
