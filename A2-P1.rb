#Assignment 2 Phase 1

#welcome message instructions for the user
puts "\t\t\t--Welcome--"
puts "\n\n \t\t\tInstruction: \n \t\t\tEnter a requried word or phrase and the path \n"+
"\t\t\tand this program will find it for you.\n\n"

#variables to use in the different state of the program
$txtCheck=0
$inputCheck=0
count=0

#obtaining user's word or phrase
puts "Enter the required word or phrase:"
input =STDIN.gets
input.chop!

#obtaning user's root directory for the search
puts "Enter root directory for search:"
root=STDIN.gets
root.chop!

#check whether the given directory exists
if File.exist?(root) then
  #changing the current working directory to user given direcotry if it xists
  Dir.chdir(root)

  #going through each and every file in the direcotry
  Dir.foreach(root) do |x|
    #check if there are text files in the user given directory
    if (x =~ /\w+.txt/) then
      #changing the value of 'textCheck', if a text file has been found
      $txtCheck=1
       #going through each and every line of the text file
       inputArray = File.readlines(x)
       inputArray.each do |line|
        #check whether if there's any match for the user given word or phrase in the text file
        if (line =~ /#{input}/i) then
          #if there's a match changing the value of 'inputCheck'
          $inputCheck=1
          #counting the number of matching text files found
          count=count+1
          #printing the root of the text file including file name
          puts "\n"+root+"\\"+x
          break
        end
       end
       
       #if there's any match for the user given word or phrase in the text file, printing all the contents
       if $inputCheck==1 then
        inputArray.each do |y|
          puts y
        end
       end
    #resetting the 'inputCheck' value to 0
    $inputCheck=0
    end
  end
  
  #printing a message if no matches found from the text files
  if (count == 0) then
    puts "No matches found!"
  end
  
  #printing a message if there aren't any text files in the directory
  if ($txtCheck==0) then
      puts "There are no text files inside this directory!"
  end
  
#printing a message if there's no matching directory
else
  puts "There's no such directory!"
end