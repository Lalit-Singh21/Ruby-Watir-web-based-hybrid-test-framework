#####################################################
#  Method to return the no. of rows in data file
#####################################################

def count_row(file)
  begin
  book=Spreadsheet.open file
  sheet1=book.worksheet 0
  #returning no of rows in the sheet
  return sheet1.row_count
  end  #begin
end  #begin




#####################################################
#  Method to read the data file
#####################################################

def excel_read(row_number,file)
begin
Spreadsheet.client_encoding='UTF-8'
#open workbook
book=Spreadsheet.open  file
#access all worksheets
#book.worksheets


sheet1 = book.worksheet 0
 r=Array.new
 #for i in 0...len do
  if ((sheet1.row(row_number)[0])=="y"||(sheet1.row(row_number)[0]=="Y")) then
     #puts r
    r=sheet1.row(row_number)
    #~ if(r[3].is_a?(Numeric)) then
        #~ if(r[3]%1==0)
         #~ r[3]=r[3].to_i #if r[3].is_a?(Integer) 
         #~ r[3]=r[3].to_s
         #~ else 
          #~ r[3]=r[3].to_s
        #~ end
    #~ end#numeric
    if(r[3].to_s.include?"{"&&"}") then
    #if(r[3].include?"{"&&"}")
      r[3]=r[3].gsub(/[{}]/,'')
      r[3]=read_data_file(r[3])
      #r[3]=a1
    end
      #r[3]=r[3].to_s
    
    
    #~ ### in case we dont want to format the cells of excel in text  ####
     if(r[3].is_a?(Numeric)) then
        #puts "numeric"
         if(r[3]%1==0)
          #puts "integer"
          r[3]=r[3].to_i #if r[3].is_a?(Integer) 
          r[3]=r[3].to_s 
          elsif(r[3]%1>0)
            #puts "float"
          r[3]=r[3].to_s
          #~ #r[3]=r[3].to_s
        end
        #~ #else
          #~ #r[3]=r[3].to_s
     end#numeric
      #~ #r[3]=r[3].to_s
        #~ #unless r[3].match(/[^[:digit:]]+/)
  #return r
  end  #if r[0]==y
      #r[3]=r[3].to_s
return r
rescue
@message="failed to read the row"
end  #begin
end  #excel_read



#####################################################
#  Method to read the second data file
#####################################################

def read_data_file(col)
begin
Spreadsheet.client_encoding='UTF-8'
book=Spreadsheet.open Input_File2

 sheet1 = book.worksheet 0

 r=Array.new
 r=sheet1.row(0)
 #puts r
 len=r.length
 for i in 0..len do
 if r[i]==col then
   r=sheet1.row($ex)
   #puts r[i]
   break
 end #if
 end #for
 return r[i]
 rescue
 @message="Failed to fetch the second data file"
 end #begin
end #def




#####################################################
#  Method to open the log file as  excel sheets
#####################################################
def open_log
  begin
  xl = WIN32OLE.new('Excel.Application')  # Create an instance of the Excel application object
  #xl.visible=1
  $wb=xl.Workbooks.Add
  $opfile1=$wb.Worksheets(1)
  $wb.SaveAs('D:\Lalit\IGWatirFramework\IG_Watir_Framework\result\Log_'+Time.new.strftime("%H-%M-%S@%d-%m-%y")+'.xls')
  end
end


#####################################################
#  Method to open the log file as text
#####################################################
#def open_log
  #File.open(of,'a') do |op| 
   #~ #for $script in 1..$no_of_scripts do
   #$opFile=File.open(Output_File ,'a')
   #~ op.puts "\n==============================================================================="
   #~ op.print "\nScript begins at "+Time.now.strftime("%H:%M:%S@%d/%m/%y (%Z)")
    #~ #$opFile.print "\nTitle of Page:"+title
   #~ op.print "\n\nTime\t\tCheckpoint\tComments\n"
   #~ op.puts "==============================================================================="

#end



#####################################################
#  Method to close the log file as excel sheets
#####################################################
def close_log
$wb.Save
$wb.close
end


#####################################################
#  Method to close the log file as text
#####################################################

#def close_log
#$opFile.close
#end


######################################################
#  Logger method to log the message and status in excel sheet
######################################################

  def log_msg(msg,status,opFile)
    begin
        opFile.range("B#{$lrow+=1}").value=[''+Time.new.strftime("%H:%M:%S")]    
       #opFile.print "\n"+Time.new.strftime("%H:%M:%S")
       opFile.range("D#{$lrow}").value=[status]
       #opFile.print"\t"+status+""
       opFile.range("F#{$lrow}").value=[msg]
       #opFile.print"\t\t"+msg+"\n"
       rescue exception=>e
       opFile.range("D#{$lrow+=1}").value=['     ErrorUser']
       #opFile.print"\tErrorUser"
       opFile.range("F#{$lrow}").value=['     Could not write the user @message']
       #opFile.print"\t\tCOuld not write the user @message\n"
     end#begin
     end# def



######################################################
#  Logger method to log the message and status in text file
######################################################

  #def log_msg(msg,status,opFile)
       #opFile.print "\n"+Time.new.strftime("%H:%M:%S")
       #opFile.print"\t"+status+""
       #opFile.print"\t\t"+msg+"\n"
       #rescue exception=>e
       #opFile.print"\tErrorUser"
       #opFile.print"\t\tCOuld not write the user @message\n"
    #end# def

#####################################################
#  to execute the given script
#####################################################

#~ def execute()
 
#~ end #def execute