#!/usr/local/bin/ruby

def scanfolder(directory)
  newfolder=(Dir.entries("#{directory}") - %w(. ..)).select { |d| d =~ /^\d{8}$/ }.sort.last

  if File.exist?("#{directory}/current")
    File.delete("#{directory}/current")
  end
  File.symlink("#{newfolder}", "#{directory}/current")

end

`ls -d */`.each do |i|
   scanfolder ("#{i}")
end

