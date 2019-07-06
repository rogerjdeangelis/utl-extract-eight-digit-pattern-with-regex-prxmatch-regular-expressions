# utl-extract-eight-digit-pattern-with-regex-prxmatch-regular-expressions
Extract eight digit pattern with regex prxmatch regular expressions

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
