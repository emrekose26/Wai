$(document).ready(function () {
    $('#social-box').on('mouseover', function () {
        $(this).css('width', '50px');
        $('#facebook div').css('display', 'block');
        $('#twitter div').css('display', 'block');
        $('#google-plus div').css('display', 'block');
    });
    $('#social-box').on('mouseleave', function () {
        $(this).css('width', '10px');
        $('#facebook div').css('display', 'none');
        $('#twitter div').css('display', 'none');
        $('#google-plus div').css('display', 'none');
    });

    var index;
    $('.list-group a').on('click', function () {
        index = $(this).index();
        $('.list-group a').removeClass("active");
        $('.list-group a:eq(' + index + ')').addClass("active");
    });
});