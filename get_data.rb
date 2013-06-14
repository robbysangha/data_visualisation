require "rubygems"
require "nokogiri"
require "open-uri"

File.open("site_names.txt", "w") do |file|
	page = Nokogiri::HTML(open("http://www.google.com/adplanner/static/top1000/"))
	site_names = page.css("table#data-table tr td.tl a:nth-child(2)")
	site_names.each do |site_name|
		site_name = site_name.text 
	end
end

File.open("site_visits.txt", "w") do |file|
	page = Nokogiri::HTML(open("http://www.google.com/adplanner/static/top1000/"))
	all_visits = page.css("table#data-table tr td:nth-child(4)")
	all_visits.each do |site_visits|
		puts site_visits
		site_visits = site_visits.text 
		file.write(site_visits + "\n") if !site_visits.nil?
	end
end
