# -*- coding: utf-8 -*-
require 'yaml'

# YAML extensions

module YAML


  # Specify one or more directory patterns, load each file, and yield each YAML document to a block.
  #
  # @see [Dir#glob](http://www.ruby-doc.org/core/classes/Dir.html#M002347) for pattern details.
  #
  # @example To load documents in files ending in ".yaml"
  #   YAML.load_dir('/tmp/*.yaml'){|yaml_document|
  #     #...whatever you want to do with each yaml document
  #   }
  #
  # @example To load documents in files beginning in "foo" or "bar"
  #   YAML.load_dir('/tmp/foo*.yaml','/tmp/bar*.yaml','){|yaml_document|
  #     #...whatever you want to do with the yaml document
  #   }
  
  def YAML.load_dir(*dirpaths)
    dirpaths=[*dirpaths.flatten]
    dirpaths.each do |dirpath|
      Dir[dirpath].each do |filename|
        File.open(filename) do |file|
          YAML.load_documents(file) do |doc|
            yield doc
          end #load
        end #file
      end #dir
    end #each
  end #def


  # Specify one or more directory patterns, load each file, and yield each YAML key and its values to a block.
  #
  # @see [Dir#glob](http://www.ruby-doc.org/core/classes/Dir.html#M002347) for pattern details.
  #
  # @example To load each key and its values, in files ending in ".yaml"
  #   YAML.load_dir_key_values('/tmp/*.yaml'){|yaml_key,yaml_values|
  #     #...whatever you want to do with each yaml key and its values
  #   }
  #
  # @example To load documents in files beginning in "foo" or "bar" and get each key and its values:
  #   YAML.load_dir_key_values('/tmp/foo*.yaml','/tmp/bar*.yaml','){|yaml_key,yaml_values|
  #     #...whatever you want to do with each yaml key and its values
  #   }
  def YAML.load_dir_key_values(*dirpaths)
    YAML.load_dir(dirpaths){|doc|
      doc.keys.each{|key|
        yield key, doc[key]
      }
    }
  end

end
