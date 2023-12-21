/**
 * 
 */

var script = document.createElement('script');
script.src = 'http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js';
script.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(script);

document.write('script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>');



var data = new FormData();
                data.append('fileAny', document.getElementById("file1"));
                data.append('fileTag', 'kjjkjk');
                data.append('userId', '1');
                
                console.log(document.getElementById("file1"));


                        $.ajax({
                            type: "POST",
                            enctype: 'multipart/form-data',
                            url: "<%=CONTEXT_PATH%>FileAnyUploader",
                            data: data,
                            processData: false,
                            contentType: false,
                            cache: false,
                            timeout: 600000,
                            success: function (data) {

                               console.og("xxxxx");
                               
                            },
                            error: function (e) {
                                

                            }
                        });