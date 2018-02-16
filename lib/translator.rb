# require modules here
require "yaml"
require "pry"

def load_library(path)
  # code goes here
  hash = YAML.load_file(path)
  output = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  hash.each do |emo, array|
    output["get_meaning"][array[1]] = emo
    output["get_emoticon"][array[0]] = array[1]
  end
  output
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  hash = load_library(path)
  if hash["get_emoticon"].has_key? emoticon
    output = hash["get_emoticon"][emoticon]
  else
    output = "Sorry, that emoticon was not found"
  end
  output
end

def get_english_meaning(path, emoticon)
  # code goes here
  hash = load_library(path)
  if hash["get_meaning"].has_key? emoticon
    output = hash["get_meaning"][emoticon]
  else
    output = "Sorry, that emoticon was not found"
  end
  output
end
