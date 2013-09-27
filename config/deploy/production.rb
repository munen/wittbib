role :app, 'wittbib-staging.panter.ch'
role :web, 'wittbib-staging.panter.ch'
role :db,  'wittbib-staging.panter.ch', :primary => true

upload "config/amazon_keys.yml", "config/amazon_keys.yml"
