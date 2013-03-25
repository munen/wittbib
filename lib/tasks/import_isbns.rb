namespace :import do
  task :isbns => :environment do
    ['9781161433197',
      '9781451648539',
      '9783548608600',
      '9783551358943',
      '9780553148527',
      '9783453352667',
      '9783257217964',
      '9783446428232',
      '9783442478972',
      '9783442478958',
      '9783440038772',
      '9783866062658',
      '9783442454259',
      '9783867604154',
      '9783789142048',
      '9783815740644',
      '9783473551231',
      '9781847194947',
      '9783499149542',
      '9783596188666',
      '9783894401320',
      '9783774220096',
      '9781592535651',
      '9783899531985',
      '9783442117512',
      '9783453066106',
      '9783499331763',
      '9783442725311',
      '9783150094037',
      '9783423620000',
      '9783434545255',
      '9783405146177',
      '9783776606744',
      '9783581664267',
      '9783880342903',
      '9783927714793',
      '9783442118120',
      '9783880596184',
      '9783774210035',
      '9783596259847',
      '9783405128050',
      '9783462041491',
      '9783492239813',
      '9783426633977',
      '9783828919921',
      '9783828948327',
      '9783257213072',
      '9783423341066',
      '9783423704663',
      '9783423108362',
      '9783453102361',
      '9783518371657',
      '9783442353811',
      '9783423113045',
      '9783453079267',
      '9789783423121',
      '9783423126496',
      '9780385609340',
      '9783453123274',
      '9783442450688',
      '9783453098732',
      '9783442423446',
      '9783499127328',
      '9783458321248',
      '9783800168569',
      '9780060839871',
      '9783405129491',
      '9783440070666'].each do |isbn|
      b = GoogleBooks.search "isbn:#{isbn}"
      sleep 10
      b = b.first
      unless b.nil?
        if b.try(:isbn).try(:length) == 10
          Book.create :authors => b.authors, :title => b.title, :isbn_10 => b.isbn, :page_count => b.page_count, :language => b.language, :publisher => b.publisher, :published_date => b.published_date, :description => b.description
        elsif b.try(:isbn).try(:length) == 13
          Book.create :authors => b.authors, :title => b.title, :isbn_13 => b.isbn, :page_count => b.page_count, :language => b.language, :publisher => b.publisher, :published_date => b.published_date, :description => b.description
        else
          Book.create :authors => b.authors, :title => b.title, :page_count => b.page_count, :language => b.language, :publisher => b.publisher, :published_date => b.published_date, :description => b.description
        end
      end
    end
  end
end
