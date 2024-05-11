

class NexusParser::Lexer

  def initialize(input)
    @input = input
    # linefeed check the input here -
    @input.gsub!(/\x0D/,"") # get rid of possible dos carrige returns
    @peek = {
      token: nil, # the first group of the last regex match
      last_match: nil # the full last regex match
    }
  end

  # checks whether the next token is of the specified class.
  def peek(token_class)
    return conditional_cache_peek(token_class, true)

  end

  # Peeks without checking the cache, but does set the cache on exit.
  def peek_no_cache_read(token_class)
    return conditional_cache_peek(token_class, false)
  end

  # return (and delete) the next token from the input stream, or raise an exception
  # if the next token is not of the given class.
  def pop(token_class)
    token = read_next_token(token_class)
    reset_peek
    if token.class != token_class
      raise(NexusParser::ParseError,"expected #{token_class.to_s} but received #{token.class.to_s} at #{@input[0..40]}...", caller)
    else
      return token
    end
  end

  private

  # Rewinds the cache before reading the next token if !read_cache.
  # Always sets the new cache.
  def conditional_cache_peek(token_class, read_cache)
    rewind_peek if !read_cache

    token = read_next_token(token_class)
    return token.class == token_class
  end

  # read (and store) the next token from the input, if it has not already been read.
  def read_next_token(token_class)
    if @peek[:token]
      return @peek[:token]
    else
      # check for a match on the specified class first
      if match(token_class)
        return @peek[:token]
      else
        # now check all the tokens for a match
        NexusParser::Tokens.nexus_file_token_list.each {|t|
          return @peek[:token] if match(t)
        }
      end
      # no match, either end of string or lex-error
      if @input != ''
        raise( NexusParser::ParseError, "Lex Error, unknown token at #{@input[0..10]}...", caller)
      else
        return nil
      end
    end
  end

  def match(token_class)
    if (m = token_class.regexp.match(@input))
      @peek[:token] = token_class.new(m[1])
      @peek[:last_match] = m[0]
      @input = @input[m.end(0)..-1]
      return true
    else
      return false
    end
  end

  def rewind_peek()
    if @peek[:token].nil? || @peek[:last_match].nil?
      return
    end

    @input = @peek[:last_match] + @input
    reset_peek
  end

  def reset_peek
    @peek[:token] = nil
    @peek[:last_match] = nil
  end
end



