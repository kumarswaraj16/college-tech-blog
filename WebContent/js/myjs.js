
function doLike(pid,uid){
    
    const d = {
       uid: uid,
       pid: pid,
       operation: 'like'
    }
    
    $.ajax({
    
        url: "LikeServlet",
        type: 'POST',
        data: d,
        success: function(data, textStatus, jqXHR){    
             console.log(data);
             if(data.trim()=='true'){
                $('#icon-p').addClass('fa-thumbs-up');
                let c = $('.like-counter').html();
                c++;
                $('.like-counter').html(c);
             }
             if(data.trim()=='false'){
                $('#icon-p').removeClass('fa-thumbs-up');
                $('#icon-p').addClass('fa-thumbs-o-up');
                let c = $('.like-counter').html();
                c--;
                $('.like-counter').html(c);
             }
        },
        error: function(jqXHR, textStatus, errorThrown){
             console.log("Some error occured!"); 
        }
    
    });

}