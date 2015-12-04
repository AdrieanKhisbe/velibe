module Velibe
  module Config
    #  §see: http://stackoverflow.com/questions/7828066/accessing-files-packaged-into-a-ruby-gem

    DB_NAME = '~/.velib.db' # TODO: more generic + config
    DB_PATH = Pathname.new(DB_NAME).expand_path # .to_s?
    DATA_CSV = '../../data/Paris.csv'

    DATA_CSV_FILE = File.join(File.dirname(File.expand_path(__FILE__)), DATA_CSV)

    KV_NAME = '~/.velib.yaml' # TODO: more generic
    KV_PATH = Pathname.new(KV_NAME).expand_path


  end
end