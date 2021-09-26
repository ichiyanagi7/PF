namespace :mystery_status do
   desc '公開予定日時を過ぎた記事を公開状態にする'
   task published: :environment do
    Mystery.publish_wait.find_each do |mystery|
      if mystery.published_at < Time.zone.now
        mystery&.published!
      end
    end
  end
end
