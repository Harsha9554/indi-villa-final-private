// @ts-nocheck
$(document).ready(function(){
    $(".ajax-loader").hide();
    $(".filter-checkbox").on("click", function(){
        var _filterObj = {};
        $(".filter-checkbox").each(function(index, ele){
            var _filterVal = $(this).val();
            var _filterKey = $(this).data('filter');
            _filterObj[_filterKey]=Array.from(document.querySelectorAll('input[data-filter='+_filterKey+']:checked')).map(function(el){
                return el.value;
           });
        });
        // run ajax
        $.ajax({
            type:"POST",
            url:'/listings',
            data: {
                _filterObj,
                csrfmiddlewaretoken:$("input[name=csrfmiddlewaretoken]").val()
            },
            dataType: 'json',
            beforeSend:function(){
                $(".ajax-loader").show();
            },
            success: function(res){
                console.log(res);
                $(".cards").html(res.listings);
                $(".ajax-loader").hide();
            }
        });
    });
});