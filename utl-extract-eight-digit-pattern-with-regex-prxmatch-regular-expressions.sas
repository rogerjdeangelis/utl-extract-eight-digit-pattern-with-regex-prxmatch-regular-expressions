Extract eight digit pattern with regex prxmatch regular expressions                                          
                                                                                                             
                                                                                                             
github                                                                                                       
https://tinyurl.com/y4jqaq7t                                                                                 
https://github.com/rogerjdeangelis/utl-extract-eight-digit-pattern-with-regex-prxmatch-regular-expressions   
                                                                                                             
                                                                                                             
StackOverflow                                                                                                
https://tinyurl.com/y4h8pf3h                                                                                 
https://stackoverflow.com/questions/56853793/sas-extract-8-digit-pattern-with-regex-prxmatch                 
                                                                                                             
Aurieli profile                                                                                              
https://stackoverflow.com/users/10845848/aurieli                                                             
                                                                                                             
I still feel regular expressions are last resort.                                                            
                                                                                                         
Insightful comment by                                                                                    
 
*____             _        
|  _ \ __ _ _   _| |       
| |_) / _` | | | | |       
|  __/ (_| | |_| | |       
|_|   \__,_|\__,_|_|       
                           
;                          

Paul Dorfman                                                                                             
sashole@bellsouth.net                                                                                    
                                                                                                         
Roger,                                                                                                   
                                                                                                         
I totally concur with your "last resort" notion. Though admitting that the regexen work much faster,     
if I were to do this in the real world, I'd likely go this route:                                        
                                                                                                         
data have ;                                                                                              
   have = '&libroot_hr./import19860426/sxh3j900/20190702_SXH3J900_20190229DWH_Adresse.txt' ;             
run ;                                                                                                    
                                                                                                         
data want ;                                                                                              
   set have ;                                                                                            
   do _n_ = 1 to countw (have, , "kd") ;                                                                 
     want = put (scan (have, _n_, ,"kd"), $8.) ;                                                         
     if N (input (want, ?? yymmdd8.)) then output ;                                                      
   end ;                                                                                                 
run ;                                                                                                    
                                                                                                         
To my mind, that has certain advantages:                                                                 
                                                                                                         
- easier to understand from the code what it's doing                                                     
- catches not only all 8-digit substrings delimited by non-digits but                                    
also validates them date-wise (which seems to be the original purpose)                                   
                                                                                                         
Kind regards                                                                                             
                                                                                                                                                                                                                                                                                                                                                                                                                                    
This ia a nice application that falls in my aformentioned                                                    
problem, cleaning up social security numbers.                                                                
                                                                                                             
HAVE                                                                                                         
====                                                                                                         
                                                                                                             
&libroot_hr./import/sxh3j900/20190702_SXH3J900_DWH_Adresse.txt                                               
                                                                                                             
WANT                                                                                                         
====                                                                                                         
                                                                                                             
20190702                                                                                                     
                                                                                                             
SOLUTION                                                                                                     
========                                                                                                     
                                                                                                             
data b(keep=have want);                                                                                      
   have='&libroot_hr./import/sxh3j900/20190702_SXH3J900_DWH_Adresse.txt';                                    
   re = prxparse("/(\d{8})/");                                                                               
   if prxmatch(re,have) then do;                                                                             
      want = prxposn(re,0,have);                                                                             
   end;                                                                                                      
run;                                                                                                         
                                                                                                             
