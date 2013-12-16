namespace :botr do

  desc "Resets videos table and re-imports all the video keys from botr"
  task :refresh => :environment do
    puts "Clearing videos database table..."
    Video.clear_table!
    puts "Establishing API connection with Bits on the Run..."
    Video.api_import
  end

  desc "Import videos from botr API"
  task :import => :environment do   
    puts "Establishing API connection with Bits on the Run"
    puts "Importing Videos..."
    result = Video.api_import      
    puts "Added #{result} New Video(s).."
  end

  desc "Displays BOTR Account usage"
  task :usage => :environment do 
    # Get month to date usage stats
    puts "Establishing API connection with Bits on the Run..."
    call = BitsOnTheRun::API.new(:call)
    call.method('accounts/usage/list', :list_by => 'day', :aggregate => 'true')
    r = call.execute
    if r.ok?
      total_videos = r.nrvideos
      mtd_content = r.content
      mtd_traffic = r.traffic
      mtd_views = r.videoviews

      mtd_content = mtd_content.number_to_human_size
      mtd_traffic = mtd_traffic.number_to_human_size
    else
      raise Exception
    end
    now = Time.new
    puts ""
    puts "BOTR Account Usage: Month to Date"
    puts "Todays Date: "+now.strftime("%B %d, %Y")
    puts "Current month: Day "+now.strftime("%d") +" of "+now.end_of_month.strftime("%d")+" days."
    puts ""
    puts "Aggregate Video Views:    #{mtd_views} views"
    puts "Aggregate Content Served: #{mtd_content}"
    puts "Aggregate Traffic Used    #{mtd_traffic}"
    puts ""

    call = BitsOnTheRun::API.new(:call)
    call.method('accounts/show')
    r = call.execute
    if r.ok?
      r.to_yaml
    else
      raise Exception
    end
  end


  desc "Displays statistics from BOTR API"
  task :stats => :environment do 
    # Get month to date usage stats
    puts "Establishing API connection with Bits on the Run..."
    call = BitsOnTheRun::API.new(:call)
    call.method('accounts/usage/list', :list_by => 'day', :aggregate => 'true')
    r = call.execute
    if r.ok?
      total_videos = r.nrvideos
      mtd_content = r.content
      mtd_traffic = r.traffic
      mtd_views = r.videoviews
    else
      raise Exception
    end
    call = BitsOnTheRun::API.new(:call)
    call.method('channels/list')
    r = call.execute
    if r.ok?
      total_playlists = r.total
      mtd_content = r.content
      mtd_traffic = r.traffic
      mtd_views = r.videoviews
    else
      raise Exception
    end
    now - Time.new
    puts ""
    puts "BOTR Stats"
    puts "Todays Date: "+now.strftime("%B %d, %Y")
    puts "Current month: Day "+now.strftime("%d") +" of "+now.end_of_month.strftime("%d")+" days."
    puts ""
    puts "Videos Hosted: #{total_videos} videos"
    puts "MTD Views:    #{mtd_views} views"
    puts "MTD Content: #{number_to_human_size(mtd_content)}"
    puts "MTD Traffic    #{number_to_human_size(mtd_traffic)}"
    puts ""
  end

end