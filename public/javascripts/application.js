

function doPrint(id) { 
    bdhtml=window.document.body.innerHTML; 
    sprnstr="<!--sprint-"+id+"-->"; 

    eprnstr="<!--eprint-"+id+"-->"; 
    prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); 
    prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); 
    window.document.body.innerHTML=prnhtml; 
    window.print(); 
}

function dxtcc(inputid,targetId ) {
    if (document.getElementById){
        target = document.getElementById( targetId );
        inputid=document.getElementById( inputid );
        if ( target.style.display == "none") {
            target.style.display = "";
            inputid.value="隐藏/Hide"
        } else {
            target.style.display = "none";
            inputid.value="显示/Show"
        }
    }
}



function printpage(print){
   
    var newstr = document.getElementById(print).innerHTML;
    
    var oldstr = document.body.innerHTML;
    document.body.innerHTML = newstr;
    window.print();
    document.body.innerHTML = oldstr;
    return false;
}



function showlianxi(status,ev){ 
    var  e= ev||window.event; 
    var show = document.getElementById('showlianxi'); 
    var obj=e.target||e.srcElement; 
    switch(status){	
        case 'over':
            show.style.position='absolute'; 
            if(e.pageX){	
                show.style.left=e.pageX+20+'px'; 
                show.style.top=e.pageY+'px'; 
            } 
            else{ 
                show.style.left=e.clientX + document.body.scrollLeft+ document.documentElement.scrollLeft+5; 
                show.style.top=e.clientY + document.body.scrollTop+ document.documentElement.scrollTop+5; 
            } 
            show.style.display='block';	
            break; 
        case 'out':
            show.style.display='none'; 
            break;	
    }	
} 
