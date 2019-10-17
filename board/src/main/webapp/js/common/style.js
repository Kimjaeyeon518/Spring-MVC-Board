function goMain() {
    location.href="/main/main";
}

function btnClick() {
    $('#welcome').hide(500);
    $('#pressButton').hide(1000);
    $('#pointer').hide(1500);
    $('.wave').hide();

    setTimeout("goMain()", 2000);
};

function goProfile() {
    location.href = "/main/profile";
}

function profileClick() {
    $('.box').slideUp(1000);
    $('#jaeyeonKim').slideUp(1000);
    setTimeout("goProfile()", 2000);
}

function goStudy() {
    location.href = "/main/study";
}

function studyClick() {
    $('.box').slideUp(1000);
    $('#jaeyeonKim').slideUp(1000);
    setTimeout("goStudy()", 2000);
}

function goGoal() {
    location.href = "/main/goal";
}

function goalClick() {
    $('.box').slideUp(1000);
    $('#jaeyeonKim').slideUp(1000);
    setTimeout("goGoal()", 2000);
}

$(document).ready(function() {
    $('.wave').click(function() {
        btnClick();
    });

    $('.photo1').hover(function() {
        $('#profile').show();
    });
    $('.photo1').mouseleave(function() {
        $('#profile').hide();
        stop;
    });

    $('.photo2').hover(function() {
        $('#study').show();
    });
    
    $('.photo2').mouseleave(function() {
        $('#study').hide();
        stop;
    });

    $('.photo3').hover(function() {
        $('#goal').show();
    });

    $('.photo3').mouseleave(function() {
        $('#goal').hide();
    });

    $('.backbtn').click(function() {
        location.href = "/main/main";
    });

    $('.studybackbtn').click(function() {
        location.href = "/main/main";
    });

    $(document).mousemove(function(e) {
        mouseX = e.pageX;
        mouseY = e.pageY;
        $('#cursor').css("left", mouseX).css("top", mouseY);
   });

   var main = $('.bxslider').bxSlider({ 

    mode: 'fade', 

    auto: false,	//자동으로 슬라이드 

    controls : true,	//좌우 화살표	

    autoControls: true,	//stop,play 

    pager:true,	//페이징 

    pause: 3000, 

    autoDelay: 0,	

    slideWidth: 800, //이미지 박스 크기설정

    speed: 500, 

    stopAutoOnclick:true 
   });
});


