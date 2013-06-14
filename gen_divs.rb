data = []
# Saves the data from 2 files as a list of lists
File.open("site_names.txt", "r") do |sn|
	File.open("site_visits.txt", "r") do |sv|
		100.times do 
			data << [(sn.readline).chomp, (((sv.readline).chomp).gsub(",", "")).to_f]
		end
	end
end

max = data[0][1]
# Writes the appropriate div blocks into an html file
File.open("divs_for_sites.html", "w") do |html|
	for i in 0..99 do
		div_width = ((data[i][1] / max) * 100).to_s
		html.write("<div class='data'>\n")
		html.write("    <div class='bar' style='width:#{div_width}%;'>#{data[i][0]}</div>\n")
		html.write("</div>\n")
	end
end