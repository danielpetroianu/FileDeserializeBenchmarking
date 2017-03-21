FileDeserializeBenchmarking
===========================

## Results

    -========== START TESTING on iPhone 5c(GSM+CDMA) ==========-
    
    -========== START FILE LOAD TESTING ==========-
    
    file:'        data_dictionary_root_1.json'  opened in avg. time:     320568 ns
    file:'        data_dictionary_root_1.plist' opened in avg. time:     271867 ns
    
    file:'       data_dictionary_root_10.json'  opened in avg. time:     494583 ns
    file:'       data_dictionary_root_10.plist' opened in avg. time:     399089 ns
    
    file:'      data_dictionary_root_100.json'  opened in avg. time:    2395171 ns
    file:'      data_dictionary_root_100.plist' opened in avg. time:    1620377 ns
    
    -========== TEST FILE LOAD ENDED ==========-
    
    
    -========== START DESERIALIZE TESTING ==========-
    
    JSONFileDeserialize  file:'   data_dictionary_root_1' avg. runtime:     334407 ns
    PlistFileDeserialize file:'   data_dictionary_root_1' avg. runtime:     299385 ns
   
    JSONFileDeserialize  file:'  data_dictionary_root_10' avg. runtime:     593139 ns
    PlistFileDeserialize file:'  data_dictionary_root_10' avg. runtime:     499578 ns
   
    JSONFileDeserialize  file:' data_dictionary_root_100' avg. runtime:    3292860 ns
    PlistFileDeserialize file:' data_dictionary_root_100' avg. runtime:    2533590 ns
    
    -========== TEST DESERIALIZE ENDED ==========-
    
    -========== TEST ENDED ==========-


## Credits

- .json files generated with http://www.filltext.com/
- .plist files generated with https://github.com/javiertoledo/json2plist
- benchmarking with method described in http://nshipster.com/benchmarking/
