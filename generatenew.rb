
 # h.each {|key, value| puts "#{key} is #{value}" }

def writenew(data,sheet)
  puts data.length
  @datapath="D:\Lalit\IGWatirFramework\IG_Watir_Framework\temp"
    temp_data=Array.new(data.length)
    
    j=1
    puts data
    for i in 1..data.length
      if (data[i][j]!=" ")
        temp_data[i]=data[i][j]
        end
      end
      tem_data=a.join(",")+"\n"
    filehandle=File.new(@datapath + "#{sheet}.csv","a")  
      filehandle.write(temp_data)
      file.close
    end     

  
  
  def readnew(sheet,sheet1)
    
  @datapath="D:\Lalit\IGWatirFramework\IG_Watir_Framework\temp"
  csv_data=File.readlines(@datapath +"#{sheet}.csv")
  header=csv_data[0].split(",")
    len=csv_data.length
    puts len
    len=header.length
    puts len
    
@a=Array.new(len)
 @temp_data=Array.new  
  @filehandle=File.new(@datapath + "#{sheet1}.csv","a")  
       @filehandle.close
       csv_data.each_with_index do |line,index|
            line.each do |z| 
               data=line[z].split(',')
            
               for i in 0..len-1
                  @a.insert(i,[header[i],data[i]])
                end
                
              for i in 0..len-1
                   for j in 0..1
                            #print @a[i][j]  if (j==0)
                            
                            if (@a[i][j]!="" && j==1)
                            @a[i][j]=header[i]+"@"+@a[i][j]
                           # print @a[i][j]
                              
                          end #if (a[i][j]!="" &&j==1)
                       # print " "
                      end 
                      #for j in 0..1  
                     
                   end    # for i in 0..12
                       
               k=0                      
              for i in 0..len-1
                if (@a[i][1]!="")
                   @temp_data[k]= @a[i][1]
                   k=k+1
                  end
              end
             
                temp=@temp_data.join(",")
                puts temp
                 @filehandle=File.new(@datapath + "#{sheet1}.csv","a")  
                @filehandle.write(temp)
                @filehandle.write("\n")
                 @filehandle.close
                   #puts temp_data
                 end  #line.each do |z| 
                  
                 @temp_data.clear
              @a.clear 
      end#csv_data.each_with_index do |line,index|
                         
           
        end
      
  
    
   
    
  readnew("Testdata","Inputdata")
            