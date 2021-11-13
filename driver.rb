######################################################
#~ Test Tool/Version                  : Ruby 1.8.6 & Watir 1.6.2                                                   
#~ Recorded Browser/version       : Microsoft Internet Explorer / v 6.0, Mozilla Firefox/ v 2.0 
#~ Description                           : To Automate all Basic Functionalities and to verify existance
#~                                               of elements in a web page the driver script reads data file
#~                                               which is excel sheet and calls the corresponding methods from 
#~                                               the Function library and pass the argument which are again read from 
#~                                               the data file.after processing it logs the result in the output file.
#~ Test Case Automated              : Yes                                                                               
#~ Parameterization Done            : Yes 
#~ Author                                  : Lalit Singh                             
#~ Script Name                          : driver.rb
#~ Script Created on                   : 16-06-09
#~ ####################################################
#~ Revision History
######################################################
#~ Rev.On                           Rev.No                                        Rev.By  
  
######################################################
#~ Modification History 
######################################################
#~ Mod.On                    Rev. No                        Mod. No                     Mod.By         
  
######################################################





#####################################################
#  Method to read the data file
#####################################################


#~ dir = File.dirname(__FILE__)
 #~ Dir[File.expand_path("#{dir}/*.rb")].each do |file|
  #~ require file
 #~ end

#require File.dirname(__FILE__) + '/../*.rb'
#~ #require 'Function_Library.rb'
require 'user_defined_functions.rb'
require 'Function_Library.rb'
require 'Config.rb'
require 'application_specific.rb'
#require 'fileutils'
require 'rubygems'
if(Browser=='ie') then
require 'watir'
else
require 'firewatir'
end
#require 'watir/ie'
require 'watir/testcase'
require 'win32ole'
require 'spreadsheet'
#require 'spreadsheet/excel'
require 'watir/winClicker.rb'

require 'watir/ie'
include Win32
require 'watir\contrib\enabled_popup'
require 'test/unit'
include Test::Unit
#require 'test/unit/assertions'

require 'watir/assertions'
include Watir::Assertions


#Watir::Browser.default=br
ENV['watir_browser']=Browser

class Driver <Watir::TestCase


#####################################################
#  First method where execution begins in the suite
#####################################################
def setup
#define constants
#$opFile=File.open(Output_File ,'a') 
$t1=Time.now
open_log
#$br=Watir::Browser.new
$br=Watir::Browser.new
$exec=0
$ex=0 #counter for no of runs
#~ #@br.goto($test_site)

end



#####################################################
#  Last method to be executed in the test suite
#####################################################
def teardown
#$br.wait(5)
#close browser
$opfile1.range("A#{$lrow+=1}").value=[ '          ------------End of script-------          ']
$opfile1.Rows($lrow).Interior.ColorIndex=15
 $opfile1.Rows($lrow).Font.Bold=true
$opfile1.range("A#{$lrow+=1}").value=[ '         ---------------------------------           ']
 $opfile1.Rows($lrow).Interior.ColorIndex=16
#$opFile.print "\n\n                    ------------End of Script-------------"
#$opFile.puts "\n==============================================================================="
#$opFile.close
#$br.close()
close_log
#$opFile.close 
end



#####################################################
#  Main Controller Method
#####################################################
def test_controller (f=Input_File)

  $check_point=0
  $clear=0
  $abort=0
  $lrow=1 #for row number in excel sheet
#choice = "Verify_Page"

#finding the no. of rows in test suite/call to count_row
#puts f
 no_of_rows=count_row(f)
 
 #puts no_of_rows
 #row=Array.new
 #Log_Msg()
 #$opFile=open_log(Output_File) if $count==0
 
 
 #$opFile= File.open(Output_File ,'a') #if $exec==0
 #File.open(Output_File ,'a') do |$opFile|
   #~ #for $script in 1..$no_of_scripts do
   
   
    if $exec==0 #logging in excel sheet
        $opfile1.Rows($lrow).Interior.ColorIndex=16 
        $opfile1.Columns(4).ColumnWidth=15.0
        $opfile1.Columns(4).ColumnWidth=20.0
        $opfile1.Columns(6).ColumnWidth=40.0
        $opfile1.range("A#{$lrow+=1}").value=['   script begins at'+Time.now.strftime("%H:%M:%S@%d/%m/%y (%Z)")]
        $opfile1.Rows($lrow).Interior.ColorIndex=15 
        $opfile1.Rows($lrow).Font.Bold=true
        $opfile1.Rows($lrow).Font.size=14
        $lrow+=4
         #$opfile1.range("A#{$lrow+=2}").value=['   Title of Page:'+"#{@title}" ]#title
        $opfile1.Rows($lrow).Interior.ColorIndex=24
         #$opfile1.Rows($lrow).Font.Bold=true
        $opfile1.range("B#{$lrow+=1}:F#{$lrow}").value=['Time',' ','Checkpoint','','Comments']
        $opfile1.Rows($lrow).Font.Bold=true
        $opfile1.Rows($lrow).Font.size=13
        $opfile1.Rows($lrow).Interior.ColorIndex=24
     
   end  # if $exec==0
   
   
  
   #if $exec==0 # logging in text file
   #$opFile.puts "\n==============================================================================="
   #$opFile.print "\nScript begins at "+Time.now.strftime("%H:%M:%S@%d/%m/%y (%Z)") #if $exec>0
    #$opFile.print "\nTitle of Page:"+title
   #$opFile.print "\n\nTime\t\tCheckpoint\tComments\n"
   #$opFile.puts "==============================================================================="
  #end

for $run in 1..$no_of_runs do ################### RUNS
  if(f==Input_File) then
   $ex+=1
  end
  #~ $check_point=0
  #~ $clear=0
  #~ $abort=0
  $opfile1.range("A#{$lrow+=1}").value=['Test Suite Started for Run '+"#{$ex }"] if f==Input_File
  $opfile1.Rows($lrow).Interior.ColorIndex=15
  #$opFile.print "\nTest Suite Started for run #{$ex}.." if f==Input_File#$exec==0&& $run==1||$run>1
 for i in 1..no_of_rows do
   #row=Array.new
   row=excel_read(i,f)
  if(row[0]=='y'||row[0]=='Y')
   puts "==============================="
   puts row #writing each row on console
   #choice =row[1]
   # switch case for calling methods from function library
    
    $br.wait
    case row[1]
      
       when "navigate_page"
          navigate_page(row[3])
       #Log_Msg()
          $opfile1.range("A#{$lrow+=1}").value=['Title of page: '+"#{@title}"]#title
          $opfile1.Rows($lrow).Interior.ColorIndex=16
          #$opFile.print "\nTitle of Page :#{@title}\n"
       if ($log=='detailed')
       log_msg(@message,@status,$opfile1)
       puts"\n"+@message+""
       end
     
     
       when "verify_page"
       verify_page(row[3])
       $check_point+=1
       if @status=="Passed"
         $clear+=1
       else
          $abort+=1
       end  
       log_msg(@message,@status,$opfile1)
       puts "\n" +@message+""
  
        
       when "click_button"
       click_button(row[2])
       if ($log=='detailed')
       log_msg(@message,@status,$opfile1)
       puts "\n" +@message+""
       end
      
       when "verify_button"
       verify_button(row[2])
       $check_point+=1
       if @status=="Passed"
         $clear+=1
         else
          $abort+=1
        end  
       log_msg(@message,@status,$opfile1)
       puts "\n" +@message+""

      
       when "click_link"
       click_link(row[2])
       if ($log=='detailed')
       log_msg(@message,@status,$opfile1)
       puts "\n" +@message+""
       end
      
       when "verify_link"
        verify_link(row[2])
        $check_point+=1
        if @status=="Passed"
         $clear+=1
         else
          $abort+=1
       end 
        log_msg(@message,@status,$opfile1)
        puts "\n" +@message+""
        
        
       when "enter_text"
      #begin
       enter_text(row[2],row[3])
       if ($log=='detailed')
       log_msg(@message,@status,$opfile1)
       puts "\n" +@message+""
       end
       #rescue Exception=>e
      #end
        
       when "clear_text"
       clear_text(row[2])
       if ($log=='detailed')
       log_msg(@message,@status,$opfile1)
       puts "\n" +@message+""
       end

        
       when "verify_textBox"
        verify_textBox(row[2])
        $check_point+=1
        if @status=="Passed"
         $clear+=1
         else
          $abort+=1
       end 
       log_msg(@message,@status,$opfile1)
        puts "\n" +@message+""
        
        
       when "verify_text"
        verify_text(row[2],row[3])
        $check_point+=1
        if @status=="Passed"
         $clear+=1
         else
          $abort+=1
       end 
       log_msg(@message,@status,$opfile1)
       puts "\n" +@message+""
        
        
       when "check_checkbox"
       check_checkbox(row[2])
       if ($log=='detailed')
       log_msg(@message,@status,$opfile1)
       puts "\n" +@message+""
       end
        
       when "clear_checkbox"
        clear_checkbox(row[2])
        if ($log=='detailed')
        log_msg(@message,@status,$opfile1)
        puts "\n" +@message+""
        end
      
        
       when "verify_checkBox"
        verify_checkbox(row[2])
        $check_point+=1
        if @status=="Passed"
         $clear+=1
        else
          $abort+=1
       end 
       log_msg(@message,@status,$opfile1)
        puts "\n" +@message+""
        
        
       when "check_radio"
       check_radio(row[2])
       if ($log=='detailed')
       log_msg(@message,@status,$opfile1)
       puts "\n" +@message+""
       end
        
       when "clear_radio"
       clear_radio(row[2])
       if ($log=='detailed')
       log_msg(@message,@status,$opfile1)
       puts "\n" +@message+""
       end
        
      when "verify_radio"
       verify_radio(row[2])
       $check_point+=1
       if @status=="Passed"
         $clear+=1
         else
          $abort+=1
       end 
       log_msg(@message,@status,$opfile1)
       puts "\n"+@message+""
        
        
       when "select_dropdown"
       select_dropdown(row[2],row[3])
       if ($log=='detailed')
       log_msg(@message,@status,$opfile1)
       puts "\n" +@message+""
       end
      
      
       when "clear_dropdown"
       select_dropdown(row[2])
       if ($log=='detailed')
       log_msg(@message,@status,$opfile1)
       #$opFile.print"\t\t"+@status+"\n"
       puts "\n" +@message+""
       end
      
      
       when "verify_dropdown"
       verify_dropdown(row[2],row[3])
       $check_point+=1
       if @status=="Passed"
         $clear+=1
         else
          $abort+=1
        end 
       log_msg(@message,@status,$opfile1)
       #$opFile.print"\t\t"+@status+"\n"
       puts "\n" +@message+""
      
      
       when "click_image"
       click_image(row[2])
       if ($log=='detailed')
       log_msg(@message,@status,$opfile1)
       puts "\n" +@message+""
       end
     
       
       when "verify_image"
       verify_image(row[2],row[3])
       log_msg(@message,@status,$opfile1)
       puts "\n" +@message+""
      
      
       when "close_page"
       close_page()
       if ($log=='detailed')
       log_msg(@message,@status,$opfile1)
       puts "\n" +@message+""
       end
     
    
       when "log_msg"
       @status="User"
       log_msg(row[3],@status,$opfile1)
       puts "\n" +@message+""
       
       
       when "pause"
       pause(row[3])
       log_msg(@message,@status,$opfile1)
       
       
       when "click_table"
       row[3]=row[3].split(',')
       click_table(row[2],row[3])
       log_msg(@message,@status,$opfile1)
       
       
       when "verify_table"
       row[3]=row[3].split(',')
       verify_table(row[2],row[3])
       log_msg(@message,@status,$opfile1)
       
       
       when "verify_span"
       verify_span(row[2],row[3])
       log_msg(@message,@status,$opfile1)
       
       
       when "verify_div"
       verify_div(row[2],row[3])
       log_msg(@message,@status,$opfile1)


      
       when "attach_window"
       attach_window(row[3])
       log_msg(@message,@status,$opfile1)
       
       
       
       when "del_Cookies"
       del_Cookies(row[3])
       log_msg(@message,@status,$opfile1)
       
      when "check_popups"
       check_popups(row[2],row[3])
       log_msg(@message,@status,$opfile1)
       
       
       when "bypass_goto"
        bypass_goto(row[2])
        log_msg(@message,@status,$opfile1) 
        
        when "mouse_hover"
        mouse_hover(row[2])
        log_msg(@message,@status,$opfile1)
        puts "\n"+@message+""
        
        when "browse_back"
        browse_back()
        log_msg(@message,@status,$opfile1)
        puts "\n"+@message+""
        
        
        when "browse_forward"
        browse_forward()
        log_msg(@message,@status,$opfile1)
        puts "\n"+@message+""
        
        
        when "popupClicker"
        popupClicker(row[2],row[3])
        log_msg(@message,@status,$opfile1)
        puts "\n"+@message+""
        
        
         when "startClicker"
        startClicker(row[3])
        log_msg(@message,@status,$opfile1)
        puts "\n"+@message+""
        
        
        when "rightClicker"
        rightClicker(row[2])
        log_msg(@message,@status,$opfile1)
        puts "\n"+@message+""
        
        
       when "execute"
       $exec +=1
       #$opFile.close
       $opfile1.range("A#{$lrow+=1}").value=['****************now in test script'+"#{$ex}"+ "#{row[3]}"+'*********']
       #$opFile.print "\n\t\t*********** now in test script #{$ex} #{row[3]}***********"
       #$opFile.close
       
       $no_of_runs=1
       #$run -=1
       test_controller(row[3])     ######################### recurcive call to test suite
       $exec-=1
       #$run +=1
       #$opFile.close
       $opfile1.range("B#{$lrow+=1}").value=[ '********back to main suite*************']         
       #$opFile.print "\n\t\t*********** back to main suite ***********"
       
       
      else # main case
       if(row[2]=='user defined') then
         x=row[3]
         case row[1]
           
             when "different_click"
                different_click(x)
                log_msg(@message,@status,$opfile1)
         
            when "FDAC_BMC"
                FDAC_BMC(x)
                log_msg(@message,@status,$opfile1)
                
                
            when "Checkbox_BMCAdapters"
                Checkbox_BMCAdapters(x)
                log_msg(@message,@status,$opfile1)    
                
            
             else # inner case
                $opfile1.range("B#{$lrow+=1}").value=["%H:%M:%S"]
                #$opFile.print "\n"+Time.new.strftime("%H:%M:%S")
                #$opFile.print"\t\t"+@status+"\n"
                 $opfile1.range("D#{$lrow+=1}").value=['Invalid option']
                 #$opFile.print"\tInvalid option"
                 $opfile1.range("F#{$lrow+=1}").value=['Please Add the desired function in the user defined function library. ']
                 #$opFile.print"\tPlease Add the desired function in the user defined function library.\n"
                puts "\nInvalid Option"
         end #case inner
       else#if of main case
          $opfile1.range("B#{$lrow+=1}").value=[Time.new.strftime("%H:%M:%S")]
          #$opFile.print "\n"+Time.new.strftime("%H:%M:%S")
          #$opFile.print"\t\t"+@status+"\n"
           $opfile1.range("D#{$lrow}").value=['Invalid option']
           #$opFile.print"\tInvalid option"
           $opfile1.range("F#{$lrow}").value=['No Such Function: ' +"#{row[1]}"+' Exists.']
           #$opFile.print"\tNo Such Function:#{row[1]} Exists.\n"
          puts "\nInvalid Option"
      end#if inner row[2]=='user defined'
      
    end #case main
     
   end #if main r[1]==y
      i+=1 # incrementing row counter
    end #for i in 1..no_of_rows

    $t2=Time.now
    #puts $t2-$t1
    #$opFile.print "\n"+Time.new.strftime("%H:%M:%S@%d/%m/%y")
  if (f==Input_File) then #  if ("end".casecmp e.to_s) then
    $opfile1.range("B#{$lrow+=2}").value=['Summary of test suite number']
         $opfile1.Rows($lrow).Interior.ColorIndex=16
    #$opFile.print"\n\n\t   **************  Summary of test suite number  ***************"
     $opfile1.range("B#{$lrow+=1}").value=['Run number '+"#{$ex}"+ 'of test suite Finished in '+"#{$t2-$t1}"+' seconds']
     $opfile1.Rows($lrow).Interior.ColorIndex=15
     $opfile1.Rows($lrow+1).Interior.ColorIndex=24
    $opfile1.range("B#{$lrow+=1}").value=[''+"#{$check_point}"+' Assertions,'+"#{$abort}"+' failures,'+"#{$clear}"+'success']
     $opfile1.Rows($lrow).Interior.ColorIndex=24
     $opfile1.Rows($lrow).Font.Bold=true
      $opfile1.Rows($lrow+=1).Interior.ColorIndex=24
    
    #$opFile.print "\n\t     Run number #{$ex} of test suite Finished in #{$t2-$t1} seconds"
    # $opFile.print "\n\t            #{$check_point} assertions, #{$abort} failures, #{$clear} success.\n\n"
    end
   #~ if($run==$no_of_runs)
    #~ $opFile.print "\n\n                    ------------End of Script-------------"
    #~ $opFile.puts "\n==============================================================================="
   
end # end  for run in 1..no_of_runs

#close_log #end  #if $exec==0#end of file 
end  #end of def test_controller

end # end of class Driver