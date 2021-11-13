
def different_click(r)
begin
a,b=r
puts "this is user defined #{r}" 
@status="Passed"
@message="executed user defined functionality #{r}"
rescue
@status="Failed"
@message="user defined functionality could not execute for #{r}"
end
end


####################################################
# function to enter text in FDAC form 
####################################################

def FDAC_BMC(obj)
begin
myArray = obj.split(/,/)
sTable=myArray[0]
sTextField=myArray[1]
sData=myArray[2]
a=Regexp.new sTable
b=Regexp.new sTextField
$br.table(:text,a).flash
$br.table(:text,a).text_field(:id,b).set(sData)
  @message="Entered FDAC data"
  @status="Action"
rescue Exception=>e
@status="Failed"
@message="user defined functionality could not execute for #{obj}"
end
end



####################################################
# function to enter text in FDAC form 
####################################################


def Checkbox_BMCAdapters(object)
  begin

  myArray = object.split(/,/)
  sName=myArray[0]
  iIndex=myArray[1]
  #check the checkbox
  #highlight the checkbox
  puts sName
  puts iIndex
  iIndex=iIndex.to_i
   $br.checkbox(:name,sName).flash
   $br.checkbox(:name=>sName,:index=>iIndex).set
  @message="checkbox checked"
  @status="Action"
  rescue Exception=>e
  @message="could not check the checkbox"
  end
end
 
 
