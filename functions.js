function getQueryParams(qs) {
    qs = qs.split("+").join(" ");

    var params = {}, tokens,
        re = /[?&]?([^=]+)=([^&]*)/g;

    while (tokens = re.exec(qs)) {
        params[decodeURIComponent(tokens[1])]
            = decodeURIComponent(tokens[2]);
    }

    return params;
}

function ToggleContent(PostID)
{
var dispAll = document.getElementById("all"+PostID).style.display;
        var dispSummary = document.getElementById("summary"+PostID).style.display;

        if (dispAll == "block")
        {
                document.getElementById("all"+PostID).style.display="none";
            document.getElementById("summary"+PostID).style.display="block";
        }
        else {
                document.getElementById("all"+PostID).style.display = "block";
                document.getElementById("summary"+PostID).style.display = "none";
        }
}


function ToggleAdd( )
{
         var el = document.getElementById("AddPost").style.display;


		if (el != "block")
        {
        	document.getElementById("AddPost").style.display="block";
		document.getElementById("FilterCategory").style.display = "none";	

        }
        else {
        		document.getElementById("AddPost").style.display = "none";
        		 document.getElementById("FilterCategory").style.display = "block";

       		 }

}

function ToggleEdit(PostID)
{
var el = document.getElementById("EditPost").style.display;
var query = getQueryParams(document.location.search);
       		if (query.action == 'edit') {
                document.getElementById("EditPost").style.display = "none;";
               
        }

if (el == "none")
        {
                document.getElementById("EditPost").style.display="block;";
        }

 
}