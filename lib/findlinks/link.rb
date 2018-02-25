
module Findlinks
  # Hold link url and a reference to the source
  class Link
    attr_reader :url
    attr_reader :node
    def initialize(url:, node: nil)
      @url = url
      @node = node
    end
  end
end
