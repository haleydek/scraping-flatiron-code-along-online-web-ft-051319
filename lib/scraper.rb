require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  attr_reader :page
  
  def get_page
    html = open('https://learn-co-curriculum.github.io/site-for-scraping/courses')
    @page = Nokogiri::HTML(html)
  end
  
    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end



