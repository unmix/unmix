module Unmix
  class SourceBase

    # the main tracks array
    # track[:title]           = track's name
    # track[:index]           = track index number from original text
    # track[:filename]        = analyzed filename to create for this track
    # track[:start_time]      = start time of the track
    # track[:process_file]    = temporary, post cut file
    attr_accessor :tracks

    # original URL that was the source for all of this craziness
    attr_accessor :url

    # the platform unmix is running on
    attr_accessor :platform

    # text that was analyze to generate the track list
    attr_accessor :description

    def initialize(params)
      # options
      @url = params[:url]
      @platform = params[:platform].to_sym

      # app settings
      Unmix::set_platform_settings platform
    end

    def step_1
      raise "Unimplemented Source base method"
    end

    def step_2
      raise "Unimplemented Source base method"
    end

    def step_3
      raise "Unimplemented Source base method"
    end

    def step_4
      raise "Unimplemented Source base method"
    end

    def run
      puts "Step 1: Analyzing source #{url}".green
      step_1
      
      puts "Found the following information:".green
      tp tracks, :index, :title, :duration, :start_time, :end_time
      puts ""

      # if no?("auto detection enabled. Is this correct or you would like to manually edit it?", :green) 
      #   # manual input
      #   exit!
      # end

      puts "Donwloading.".green
      step_2

      # cut the video file into pieces
      puts "Cutting Video File.".green
      step_3

      # orginize the cuted files into an album folder
      puts "Orginizing Into an Album Folder.".green
      step_4

      puts "All Done!".green      
    end

  end
end