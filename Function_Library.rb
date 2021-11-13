######################################################
#~ Test Tool/Version                  : Ruby 1.8.6 & Watir 1.6.2                                                   
#~ Recorded Browser/version       : Microsoft Internet Explorer / v 6.0, Mozilla Firefox/ v 2.0 
#~ Description                           : To Automate all Basic Functionalities and to verify existance
#~                                               of elements in a web page.
#~ Test Case Automated              : Yes                                                                               
#~ Parameterization Done            : Yes                                                                               
#~ Author                                  :  Lalit Singh                                   
#~ Script Name                          : Function_library.rb
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


#object array and default methods to locate the elements
$how=[:id,:text,:value,:title,:url,:xpath,:href,:class,:for,:index,:src,:alt,:type,:action,:method,:name,:onclick]

$hlen=$how.length
$button_how=:id
$radio_how=:id
$checkbox_how=:id
$textfield_how=:id
$selectlist_how=:id
$link_how=:text
$image_how=:id
$table_how=:id
$span_how=:id
$div_how=:id




#####################################################
#  Method to open the page
#####################################################
def navigate_page(url)
  begin
   $br.goto(url)
   #$br.start(url)
   #$u=$br.url
   $br.visible=true
   $br.bring_to_front
   $br.maximize
   #$br.speed=:zippy
  @title=$br.title
  @status="Action"
  @message="Page opened"
  #title=$br.title
  url=$br.url
  rescue
  Watir::Exception::NavigationException
  @message="Page could not open"
  #return @message
  end #begin
 end #def
 


#####################################################
#  Method to verify the page
#####################################################
def verify_page(data)
  begin
   #checking title of page
   #if(!verify($br.title.include?(title)))
   #url=$br.url
   #$br.goto(url)
   #$br.url=$u
   #puts u
   
   # if(($br.url)==(u)) then
   #$br.goto(u)
   #else
    #puts "url is same in the verification"
   # end
   
   if(!verify($br.text.include?(data)))
     @message="verified Page for text :"+data+""
     @status="Passed"
     else
     @message="Could not verify Page for :"+data+""
     @status="Failed"
   end  # if
   rescue Exception=>e
   @message=e
   @status="Failed"
   end  #begin
 end  #def
 
 

#####################################################
#  Method to close the browser
#####################################################
 def close_page()
   begin
   #close the page
   $br.close
  @message="Successfully closed the Page"
  @status="Action"
   rescue Exception => e
   @message="Could not close the Page"
 end  #begin
end   #def



#####################################################
# Method to click the link on the web page
#####################################################
def click_link(object)
  begin
    a=Regexp.new object
  if($run==1)
  for i in 0..$hlen-1
   if($br.link($how[i],a).exists? rescue next i) then
    $link_how=$how[i]
    break
  end #if
  end # for
end #if run==1
  #clicking the link

  $br.link($link_how,a).flash
  $br.link($link_how,a).click
  @status="Action"
  @message="Click the link"
  rescue Exception => e
  @message="Could not click the link"
  end  #begin
end    #def




#####################################################
#  Method to verify the link on the web page
#####################################################
def verify_link(object)
  begin
    a=Regexp.new object
    #checking existance of link
  if($run==1)
  for i in 0..$hlen-1
   if($br.link($how[i],a).exists? rescue next i) then
    $link_how=$how[i]
    break
  end #if
  end # for
end #if run==1
   if(!verify($br.link($link_how,a).exists?))
     @message="Verifying link"
     @status="Passed"
     else
     @message="Could not Verifying link"
     @status="Failed"
   end #if
   rescue Exception=>e
   @status="Failed"
   @message=e
  end  #begin
  end  #def
 


#####################################################
#  Method to click the button on the web page
#####################################################
def click_button(object)
  begin
    a=Regexp.new object
  #clicking the button
  if($run==1)
  for i in 0..$hlen-1
   if($br.button($how[i],a).exists? rescue next i) then
    $button_how=$how[i]
    break
  end #if
  end # for
end #if run==1

$br.button($button_how,a).flash
 $br.button($button_how,a).click
  @message="Clicked button"
  @status="Action"
  rescue Exception=>e
  @message="Could not click the button"
  end  #begin
end   #def





#####################################################
#  Method to verify the presence of button on the web page
#####################################################
def verify_button(object)
  begin
    a=Regexp.new object
  #checking existance of link
  if($run==1)
  for i in 0..$hlen-1
   if($br.button($how[i],a).exists? rescue next i) then
    $button_how=$how[i]
    break
  end #if
  end # for
end #if run==1

   if(!verify($br.button($button_how,a).exists?))
     @message="Button verification"
     @status="Passed"
     else
     @message="Button verification"
     @status="Failed"
   end #if
   rescue Exception=>e
   @status="Failed"
   @message=e
  end  #begin
end  #def



#####################################################
#  Method to fill the text in the text box
#####################################################
def enter_text(object,data)
  begin
   a=Regexp.new object
  if($run==1)
    for i in 0..$hlen-1
   if($br.text_field($how[i],a).exists? rescue next i) then
    $textfield_how=$how[i]
    puts $textfield_how
    break
  end #if
  end # for
 end #if run==1
  #puts $textfield_how
  #data=data.to_s unless data.match(/[^[:digit:]]+/)
  
    $br.text_field($textfield_how,a).flash
    $br.text_field($textfield_how,a).set(data)
  @message="To enter the text :"+data+""
  @status="Action"
   puts data
  rescue Exception =>e
  @message="Could not enter the text :"+data+""
  end  #begin
end   #end



#####################################################
#  Method to clear the  text from the text box
#####################################################
def clear_text(object)
  begin
  a=Regexp.new object
  if($run==1)
  for i in 0..$hlen-1
   if($br.text_field($how[i],a).exists? rescue next i) then
    $textfield_how=$how[i]
    break
  end #if
  end # for
end #if run==1
   a=Regexp.new object
   $br.text_field($textfield_how,a).flash
    $br.text_field($textfield_how,a).clear
  @message="To clear the text"
  @status="Action"
   rescue Exeption => e
  @message="Could not clear the text"
  end  #begin
end   #end


#####################################################
#  Method to verify the presence of text box on the web page
#####################################################
def verify_textBox(object)
  begin
    a=Regexp.new object
  #checking existance of textbox
  if($run==1)
  for i in 0..$hlen-1
   if($br.text_field($how[i],a).exists? rescue next i) then
    $textfield_how=$how[i]
    break
  end #if
  end # for
 end #if run==1
   if(!verify($br.text_field($textfield_how,a).exists?))
     @message="Verifying Text Box"
     @status="Passed"
    else
      @message="Could not verify text box"
      @status="Failed"
    end
 rescue Exception=>e
 @status="Failed"
 @message="Could not verify Text Box"
end #begin
end #def



#####################################################
#  Method to verify the presence of text in the text box
#####################################################
def verify_text(object,text)
  begin
    a=Regexp.new object  
  #checking existance of textbox
  if($run==1)
  for i in 0..$hlen-1
   if($br.text_field($how[i],a).exists? rescue next i) then
    $textfield_how=$how[i]
    break
  end #if
  end # for
 end #if run==1
  if(!verify(($br.text_field($textfield_how,a).value==text)))
    #if($br.text_field(how[i],object).value==text)
    @message="verifying text in text box:"+text+""
      @status="Passed"
      #end
    else
    @message="Could not verify text in text box:"+text+""
    @status="Failed"
   end #if
   rescue Exception=>e
   @status="Failed"
   @message=e
end #begin
end #def



#####################################################
#  Method to check the checkbox
#####################################################
def check_checkbox(object)
  begin
    a=Regexp.new object
  if($run==1)
  for i in 0..$hlen-1
   if($br.checkbox($how[i],a).exists? rescue next i) then
    $checkbox_how=$how[i]
    break
  end #if
  end # for
 end #if run==1
  #check the checkbox
  $br.checkbox($checkbox_how,a).set
  #highlight the checkbox
  $br.checkbox($checkbox_how,a).flash
  @message="checkbox checked"
  @status="Action"
  rescue Exception=>e
  @message="could not check the checkbox"
  end
end
 
 
 
#####################################################
#  Method to uncheck the checkbox
#####################################################
def clear_checkbox(object)
  begin
    a=Regexp.new object
  if($run==1)
  for i in 0..$hlen-1
   if($br.checkbox($how[i],a).exists? rescue next i) then
    $checkbox_how=$how[i]
    break
  end #if
  end # for
 end #if run==1
  #check the checkbox
  #clear the checkbox
  $br.checkbox($checkbox_how,a).clear
  #highlight the checkbox
  $br.checkbox($checkbox_how,a).flash
  @message="cleared the checkbox"
  @status="Action"
  rescue Exception =>e
  @message="could not clear the checkbox"
  end
end



#####################################################
#  Method to verify the existence of checkbox
#####################################################
def verify_checkBox(object)
  begin
    a=Regexp.new object
  if($run==1)
  for i in 0..$hlen-1
   if($br.checkbox($how[i],a).exists? rescue next i) then
    $checkbox_how=$how[i]
    break
  end #if
  end # for
 end #if run==1
  #checking existance of textbox
  if(!verify($br.checkbox($checkbox_how,a).exists?))
    @message="Verified Checkbox"
     @status="Passed"
    else
    @message="Could not verify Checkbox"
     @status="Failed"
   end #if
   rescue Exception=>e
   @status="Failed"
   @message=e
end #begin
end #def




#####################################################
#  Method to check the radio button
#####################################################
def check_radio(object)
  begin
    a=Regexp.new object
  if($run==1)
  for i in 0..$hlen-1
   if($br.radio($how[i],a).exists? rescue next i) then
    $radio_how=$how[i]
    break
  end #if
  end # for
 end #if run==1
  #check the radio button
  $br.radio($radio_how,a).flash
  $br.radio($radio_how,a).set
  @message="checked the Radio Button"
  @status="Action"
  rescue Exception => e
  @message="could not check the Radio Button"
  end #begin
end #def



#####################################################
#  Method to uncheck the radio button
#####################################################
 def clear_radio(object)
  begin
    a=Regexp.new object
  if($run==1)
  for i in 0..$hlen-1
   if($br.radio($how[i],a).exists? rescue next i) then
    $radio_how=$how[i]
    break
  end #if
  end # for
 end #if run==1
  #uncheck the radio button
  $br.radio($radio_how,a).flash
  $br.radio($radio_how,a).clear
  @message="unchecked the Radio Button"
  @status="Action"
  rescue Exception => e
  @message="Could not uncheck the Radio Button"
  end #begin
end #def




#####################################################
#  Method to verify the existance of radio button
#####################################################
def verify_radio(object)
  begin
    a=Regexp.new object
  if($run==1)
  for i in 0..$hlen-1
   if($br.radio($how[i],a).exists? rescue next i) then
    $radio_how=$how[i]
    break
  end #if
  end # for
 end #if run==1
  #checking existance of textbox
  if(!verify($br.radio($radio_how,a).exists?))
    @message="Verified Radio Button"
    @status="Passed"
    else
    @message="Could not verify Radio Button"
    @status="Failed"
  end #if
  rescue Exception=>e
end #begin
end #def



#####################################################
#  Method to select option from select_list
#####################################################
def select_dropdown(object,data)
  begin
    a=Regexp.new object
  if($run==1)
  for i in 0..$hlen-1
   if($br.select_list($how[i],a).exists? rescue next i) then
      #~ # if($br.select_list($how[i],object).exists? rescue next i) then
    $selectlist_how=$how[i]
    break
  end #if
  end # for
 end #if run==1
  #a = a.to_i unless a.match(/[^[:digit:]]+/), a.is_a?(Numeric,Integer)

  
if((data).include?"*") then
  data=data.gsub(/[*]/,'')
  #select given option in the dropdown
  $br.select_list($selectlist_how,a).select_item_in_select_list(:index,data.to_i)
  else
    #select given option in the dropdown
  $br.select_list($selectlist_how,a).select(data)
end
  @message="selected the option:"+data+""
  @status="Action"
  puts data
  rescue Exception =>e 
  @message="Could not select the option"+data+""
  end #begin
end #def




#####################################################
# Method to clear the selected option from select_list
#####################################################
def clear_dropdown(object)
  begin
    a=Regexp.new object
  if($run==1)
  for i in 0..$hlen-1
   if($br.select_list($how[i],a).exists? rescue next i) then
    $selectlist_how=$how[i]
    break
  end #if
  end # for
 end #if run==1

    #highlight the select_list
    $br.select_list($selectlist_how,a).flash
    #clear the dropdown
    $br.select_list($selectlist_how,a).clear
  @message="cleared the Select Box"
  @status="Action"
  rescue Exception =>e
  @message="Could not clear the Select Box"
  end #begin
end #def  




#####################################################
# Method to verify the existance of radio button
#####################################################
def verify_dropdown(object,data)
  begin
    a=Regexp.new object
  if($run==1)
  for i in 0..$hlen-1
   if($br.select_list($how[i],a).exists? rescue next i) then
    $selectlist_how=$how[i]
    break
  end #if
  end # for
 end #if run==1

  #checking existance of Select Box and if it contains the option
  #if(!verify($br.select_list(:name,object).text.include?(data)))
  if(!verify($br.select_list($selectlist_how,a).getSelectedItems==data))
    @message="Verifying Select List"
     @status="Passed"
    else
    @message="Could not verify Select List"
    @status="Failed"
  end #if
  rescue Exception=>e
  @status="Failed"
  @message=e
end #begin
end #def






#####################################################
# Method to click an image on the web page
#####################################################
def click_image(object)
  begin
    a=Regexp.new object
  if($run==1)
  for i in 0..$hlen-1
   if($br.image($how[i],a).exists? rescue next i) then
    $image_how=$how[i]
    break
  end #if
  end # for
end #if run==1

  $br.image($image_how,a).flash
  $br.image($image_how,a).click
  @status="Action"
  @message="Click the link"
  rescue Exception => e
  @message="Could not click the image"
  end  #begin
end    #def




#####################################################
#  Method to verify the presence of image on the web page
#####################################################
def verify_image(object,data)
  begin
    a=Regexp.new object
  #checking existance of link
  if($run==1)
  for i in 0..$hlen-1
   if($br.image($how[i],a).exists? rescue next i) then
    $image_how=$how[i]
    break
  end #if
  end # for
end #if run==1
    #highlighting
    $br.image($image_how,a).flash
    if (!verify($br.image($image_how,a).src==data))
     @message="Verifying link"
     @status="Passed"
     else
     @message="Could not Verifying link"
     @status="Failed"
   end #if
   rescue Exception=>e
   @status="Failed"
   @message=e
  end  #begin
end  #def




#####################################################
#  Method to make the script wait till the last execution is finished
#####################################################
def pause(data)
begin
$br.wait(data)
@message="suspended for #{$br.down_load_time} seconds"
@status="Action"
rescue Exception=>e
@message=e
end
end




#####################################################
#  Method to make the script wait till the last execution is finished
#####################################################
def pause_condition(data)
begin
$br.wait_until(data)
@message="suspended for #{$br.down_load_time} seconds"
@status="Action"
rescue Exception=>e
@message=e
end
end




####################################################
# function to attach diffrent window with the current instance of the browser
####################################################
def attach_window(data)
begin
   $br=Watir::Browser.attach(:url,data)
   #$br.attach(:url,data)
   $br.visible=true
   $br.bring_to_front
   $br.maximize
   @title=$br.title
@message="Atached to window #{data}"
@status="Action"
rescue Exception=>e
Watir::Exception::NavigationException
@message="Page not found"
end
end





####################################################
# function to delete the cookies
####################################################
def del_Cookies(dir= "C:\\Documents and Settings\\#{ENV['USERNAME']}\\Cookies")
      begin
      # or wherever your cookies are downloaded to (can be browser specific)
      FileUtils.rm_rf dir
      @message="Cookies Deleted"
      @status="Action"
      rescue Exception=>e
      @message=e
      end
end




####################################################
# function to click a cell in the table
####################################################
def click_table(object,data)
  begin
    a=Regexp.new object
  #clicking the button
  if($run==1)
  for i in 0..$hlen-1
   if($br.table($how[i],a).exists? rescue next i) then
    $table_how=$how[i]
    break
  end #if
  end # for
end #if run==1
 i,j=data
 $br.table($table_how,a)[i][j].flash
 $br.table($table_how,a)[i][j].click
  @message="Clicked table cell"
  @status="Action"
  rescue Exception=>e
  @message="Could not click the table cell"
  end  #begin
end   #def





####################################################
# function to verify the existance of table 
####################################################
def verify_table(object,data)
begin
  a=Regexp.new object
 if($run==1)
  for i in 0..$hlen-1
   if($br.table($how[i],a).exists? rescue next i) then
    $table_how=$how[i]
    break
  end #if
  end # for
 end #if run==1
  #checking existance of textbox
  i,j,d=data
  if(!verify($br.table($table_how,a)[i][j].value==d))
    @message="Verified table"
    @status="Passed"
    else
    @message="Could not verify the table"
    @status="Failed"
  end #if
  rescue Exception=>e
   @status="Failed"
   @message=e
end #begin
end #def



####################################################
# function to verify the existance of table data in given cell
####################################################
def verify_table_cell(object,data)
begin
  a=Regexp.new object
 if($run==1)
  for i in 0..$hlen-1
   if($br.table($how[i],a).exists? rescue next i) then
    $span_how=$how[i]
    break
  end #if
  end # for
 end #if run==1
  #checking existance of textbox
  if(!verify($br.table($table_how,a).text.include?(data)))
    @message="Verified text in table"
    @status="Passed"
    else
    @message="Could not verify the text in table"
    @status="Failed"
  end #if
  rescue Exception=>e
   @status="Failed"
   @message=e
end #begin
end #def



####################################################
# function to verify the existance of a span
####################################################
def verify_span(object,data)
begin
  a=Regexp.new object
 if($run==1)
  for i in 0..$hlen-1
   if($br.span($how[i],a).exists? rescue next i) then
    $span_how=$how[i]
    break
  end #if
  end # for
 end #if run==1
  #checking existance of textbox
  if(!verify($br.span($span_how,a).text.include?(data)))
    @message="Verified text in span"
    @status="Passed"
    else
    @message="Could not verify the text in span"
    @status="Failed"
  end #if
  rescue Exception=>e
   @status="Failed"
   @message=e
end #begin
end #def




####################################################
# function to verify the existance of table data in given cell
####################################################
def verify_div(object,data)
  begin
    a=Regexp.new object
  #clicking the button
  if($run==1)
  for i in 0..$hlen-1
   if($br.div($how[i],a).exists? rescue next i) then
    $div_how=$how[i]
    break
  end #if
  end # for
end #if run==1
$br.div($div_how,a).flash
 $br.div($div_how,a).click
  @message="Clicked button"
  @status="Action"
  rescue Exception=>e
  @message="Could not click the button"
  end  #begin
end  #def


####################################################
# This is a function which handle popups
####################################################
def popupClicker(button,user_input=nil)
  begin
 hwnd = $br.enabled_popup(waitTime=9)
  if (hwnd)  
     @message="yes there is a popup #{hwnd}"
     uID=user_input[0].to_s
     pwrd=user_input[1]
     #,pwrd=user_input
    if ( user_input )
     w = WinClicker.new
      puts "hello"
      puts" #{user_input}"
      puts" watch#{user_input[1].to_s}"
      uid=w.getHandleOfControl(hwnd,"ComboBox",0)
      w.setTextValueForFileNameField(  uid, "#{u=uID.to_s}" )
      pw=w.getHandleOfControl(hwnd,"",0)
      w.setTextValueForFileNameField(  pw, "#{pwrd}" )
    end
    # I put this in to see the text being input it is not necessary to work
     sleep(3)
    # "OK" or whatever the name on the button is 
     w.makeWindowActive(hwnd)
     w.clickWindowsButton_hwnd( hwnd, "#{button}") 
     #@message="pop up button clicked"
     @status="Action"
      #this is just cleanup
     w=nil
     end
   rescue Exception =>e
    @message=e
    @status="Failed"
end
end

####################################################
# This is a function which handle popups
####################################################
def startClicker( button ,waitTime=9, user_input=nil )
  begin
  # get a handle if one exists
  hwnd = $br.enabled_popup(waitTime)
  if (hwnd)  #yes there is a popup
    w = WinClicker.new
    if ( user_input )
      uid,pw=user_input
      w.setTextValueForFileNameField( hwnd, "#{user_input}" )
    end
    # I put this in to see the text being input it is not necessary to work
    sleep(3)
    # "OK" or whatever the name on the button is
     w.makeWindowActive(hwnd)
    w.clickWindowsButton_hwnd( hwnd, "#{button}" )
    
    @message="Successfully clicked dialog box"
    @status="Action"
    # this is just cleanup
    w=nil
    end
    rescue Exception =>e
    @message=e
    @status="Failed"
  end
end


####################################################
# This is a function to handle the popups and security alerts
####################################################
def check_popups(title,text)#pending
Timeout::timeout(2) do
begin
       autoit=WIN32OLE.new('AutoItX3.Control')
        ret=autoit.WinWait(title,"",60)
        if (ret==1)
            @message = "There is popup."
            @status = "Passed"
            autoit.WinActivate(title)
            button.downcase!
            if button.eql?("ok") || button.eql?("yes") || button.eql?("continue")
                autoit.Send("{Enter}")
             else
                autoit.Send("{tab}")
                autoit.Send("{Enter}")
            end
        else if (ret==0)
            @message ="No popup, please check your code."
            @status="Failed"
          end
          end
rescue Timeout::Error
@message="No popup found"
@status="Failed"
end
end#timeout(2)
end

####################################################
# This is a function which causes mause click on any element 
####################################################

module Watir
  class Element
    def top_edge
      assert_exists
      assert_enabled
      ole_object.getBoundingClientRect.top.to_i
    end

    def top_edge_absolute
      top_edge + container.document.parentWindow.screenTop.to_i
    end

    def left_edge
      assert_exists
      assert_enabled
      ole_object.getBoundingClientRect.left.to_i
    end

    def left_edge_absolute
      left_edge + container.document.parentWindow.screenLeft.to_i
    end

    def right_click
      x = left_edge_absolute
      y = top_edge_absolute
      WindowsInput.move_mouse(x, y)
      WindowsInput.right_click
    end
  end
end 

module WindowsInput
  # Windows API functions
  SetCursorPos = Win32API.new('user32','SetCursorPos','II','I')
  SendInput = Win32API.new('user32','SendInput', 'IPI', 'I') 
 #SetCursorPos = Win32API.new('SetCursor', 'II', 'I', 'user32')
  #SendInput = Win32API.new('SendInput', 'IPI', 'I', 'user32') 
 # Windows API constants
  INPUT_MOUSE = 0 
  MOUSEEVENTF_LEFTDOWN = 0x0002 
  MOUSEEVENTF_LEFTUP = 0x0004 
  MOUSEEVENTF_RIGHTDOWN = 0x0008 
  MOUSEEVENTF_RIGHTUP = 0x0010 

  module_function

  def send_input(inputs) 
    n = inputs.size 
    ptr = inputs.collect {|i| i.to_s}.join # flatten arrays into single string 
    SendInput.call(n, ptr, inputs[0].size) 
  end

  def create_mouse_input(mouse_flag) 
    mi = Array.new(7, 0) 
    mi[0] = INPUT_MOUSE 
    mi[4] = mouse_flag 
    mi.pack('LLLLLLL') # Pack array into a binary sequence usable to SendInput 
  end 

  def move_mouse(x, y)
    SetCursorPos.call(x, y)
  end

  def right_click
    rightdown = create_mouse_input(MOUSEEVENTF_RIGHTDOWN) 
    rightup = create_mouse_input(MOUSEEVENTF_RIGHTUP) 
    send_input( [rightdown, rightup] )
  end
end


def rightClicker(object,count)
  begin
      a=Regexp.new object
  if($run==1)
     for i in 0..$hlen-1
          if($br.link($how[i],a).exists? rescue next i) then
                  $link_how=$how[i]
                   $br.link($div_how,a).focus
                   $br.link($div_how,a).right_click
                  @message="Right Click over link"
                  @status="Action"
                  break
                  end
                  
           if($br.button($how[i],a).exists? rescue next i) then
                     $button_how=$how[i]
                     $br.button($div_how,a).focus
                     $br.button($div_how,a).right_click
                    @message="Right Click over button"
                    @status="Action"
                    break
                    end
                    
                  
          if($br.radio($how[i],a).exists? rescue next i) then
                   $radio_how=$how[i]
                   $br.radio($div_how,a).focus
                   $br.radio($div_how,a).right_click
                   @message="Right Click over radio button"
                   @status="Action"
                   break
                   end
                   
            
           if($br.checkbox($how[i],a).exists? rescue next i) then
                   $checkbox_how=$how[i]
                   $br.checkbox($div_how,a).focus
                   $br.checkbox($div_how,a).right_click
                   @message="Right click over checkbox"
                   @status="Action"
                   break
                   end
                   
                  
      
            if($br.image($how[i],a).exists? rescue next i) then
                   $image_how=$how[i]
                   $br.image($div_how,a).focus
                   $br.image($div_how,a).right_click
                   @message="Right Click over image"
                   @status="Action"
                    break
                    end
                    
                   
             if($br.textfield($how[i],a).exists? rescue next i) then
                    $textfield_how=$how[i]
                    $br.textfield($div_how,a).focus
                    $br.textfield($div_how,a).right_click
                    @message="Right Click over textfield"
                    @status="Action"
                     break
                     end
                     
              
             if($br.table($how[i],a).exists? rescue next i) then
                    $table_how=$how[i]
                     $br.table($div_how,a).focus
                     $br.table($div_how,a).right_click
                    @message="Right Click over table"
                    @status="Action"
                     break
                     end
                     
              
             if($br.span($how[i],a).exists? rescue next i) then
                     $span_how=$how[i]
                      $br.span($div_how,a).focus
                     $br.span($div_how,a).right_click
                     @message="Right click over text in span"
                     @status="Action"
                     break
                     end
                                        
            
              if($br.div($how[i],a).exists? rescue next i) then
                     $div_how=$how[i]
                     $br.div($div_how,a).focus
                     $br.div($div_how,a).right_click
                     @message="Right click over button"
                     @status="Action"
                     break
                     end
                     
             #if
           end # for
           i=0
        while i<count do
             $br.send_keys("{DOWN}")
         end
  
  
  
  
  #$br.send_keys("{enter}")
           
           
end #if run==1
 
 
 end
 end
 
 
 
 ####################################################
# This is a function which bypasses security alerts without letting them to appear
####################################################
 
 
def bypass_goto(url)
    begin
    t = Thread.new(){
    #puts "winclicker thread started"
    wc = WinClicker.new
    wc.clearSecurityAlertBox
    }
    m = Thread.new($br) {
    $br.goto(url)
    }
    m.join
    t.join

    $br.bring_to_front
    #$br.maximize
    @message="Successfully bypassed the security alert"
    @message="Passed"
  
  rescue Exception =>e
  @message=e
  @status="Failed"
end
end


####################################################
# This function simply performs mouse over on any object whose id is passed to it
####################################################


def mouse_hover(object)
  begin
  
  if($run==1)
     for i in 0..$hlen-1
          if($br.link($how[i],object).exists? rescue next i) then
                  $link_how=$how[i]
                  $br.link($link_how,object).fire_event("onMouseOver")
                  @message="Mouse over link"
                  @status="Action"
                  break
                  end
                  
           if($br.button($how[i],object).exists? rescue next i) then
                    $button_how=$how[i]
                    $br.button($button_how,object).fire_event("onMouseOver")
                    @message="Mouse over button"
                    @status="Action"
                    break
                    end
                    
                  
          if($br.radio($how[i],object).exists? rescue next i) then
                   $radio_how=$how[i]
                   $br.radio($radio_how,object).fire_event("onMouseOver")
                   @message="Mouse over radio button"
                   @status="Action"
                   break
                   end
                   
            
           if($br.checkbox($how[i],object).exists? rescue next i) then
                   $checkbox_how=$how[i]
                   $br.checkbox($checkbox_how,object).fire_event("onMouseOver")
                   @message="Mouse over checkbox"
                   @status="Action"
                   break
                   end
                   
                  
           if($br.selectlist($how[i],object).exists? rescue next i) then
                   $selectlist_how=$how[i]
                   $br.selectlist($selectlist_how,object).fire_event("onMouseOver")
                   @message="Mouse over dropdown"
                   @status="Action"
                   break
                   end
                   
              
            if($br.image($how[i],object).exists? rescue next i) then
                   $image_how=$how[i]
                   $br.image($image_how,object).fire_event("onMouseOver")
                   @message="Mouse over image"
                   @status="Action"
                    break
                    end
                    
                   
             if($br.textfield($how[i],object).exists? rescue next i) then
                    $textfield_how=$how[i]
                    $br.textfield($textfield_how,object).fire_event("onMouseOver")
                    @message="Mouse over textfield"
                    @status="Action"
                     break
                     end
                     
              
             if($br.table($how[i],object).exists? rescue next i) then
                    $table_how=$how[i]
                    $br.table($table_how,object).fire_event("onMouseOver")
                    @message="Mouse over table"
                    @status="Action"
                     break
                     end
                     
              
             if($br.span($how[i],object).exists? rescue next i) then
                     $span_how=$how[i]
                     $br.span($span_how,object).fire_event("onMouseOver")
                     @message="mouse over text in span"
                     @status="Action"
                     break
                     end
                                        
            
              if($br.div($how[i],object).exists? rescue next i) then
                     $div_how=$how[i]
                     $br.div($div_how,object).fire_event("onMouseOver")
                     @message="Mouse over button"
                     @status="Action"
                     break
                     end
                     
             #if
     end # for
   end #if run==1
 
rescue Exception =>e
  @message=e
  @status="Failed"

end#begin

end #def

 ####################################################
# This function clicks back button of browser
####################################################
def browse_back()
  begin
  $br.back
  sleep(5)
  @message="Browser is navigated back"
  @status="Action"
  rescue Exception =>e
  @message=e
  @status="Failed"
  end
end


####################################################
# This function clicks forward button of browser
####################################################
def browse_forward()
  begin
  $br.forward
  sleep(5)
  @message="Browser is navigated forward"
  @status="Action"
  rescue Exception =>e
  @message=e
  @status="Failed"
  end
end


####################################################
# This is a custumized function for my application
####################################################
#def cc_new1(object,data)
#begin
#end
#end

