#Assignment 2 Phase 2

#loading a ruby gem for the script
require 'search_in_file'

class FileSearch

  $fileCheck=false

  def instructions
    #welcome message instructions for the user
    puts "\t\t\t--Welcome--"
    puts "\n\n \t\t\tInstruction: \n \t\t\tEnter a requried word or phrase and the path of it and\n"+
    "\t\t\tthis program will find and print it only a match is found.\n\n"
  end

  def assign(root, input)
    
    @path = root
    @term = input
    
    #check whether the given directory exists
    if File.exist?(@path) then
      #changing the directory
      Dir.chdir(@path)
      check
    else
       puts "There's no such directory!"
    end
  end

  def check   
    #using the 'searching in file' method from the loaded gem to search valid file types and the term
    result = SearchInFile.search(@path,@term)
    #loaded method outputs a hash array so this will print that array, only if any results are available
    if(result.any?)
       $fileCheck=true
        printFile(result)   
    end
    
    if $fileCheck==false then
      puts "No matching file types or no matching terms found!"
    end
    
  end

#printing the hash array
  def printFile(data)
    for x in data
      puts "\n"+x[:file]
      puts x[:paragraphs]
    end
    
  end
  
end

#creating instance of class FileSearch
fs=FileSearch.new
fs.instructions

#obtaining user's word or phrase
puts "Enter the required word or phrase:"
input =STDIN.gets
input.chop!

#obtaning user's root directory for the search
puts "Enter root directory for search:"
root=STDIN.gets
root.chop!

fs.assign(root, input)
