jQuery(function($){ 
    $.datepicker.regional['zh-CN'] = { 
        clearText: '清除|Clear', 
        clearStatus: '清除已选日期|Clear Selected Date', 
        closeText: '关闭<br/>Close', 
        closeStatus: '不改变当前选择', 
        prevText: '上一月 | Prev. Month', 
        prevStatus: '显示上月<br/>Show Prev. Month', 
        prevBigText: '<<', 
        prevBigStatus: '显示上一年<br/>Show Prev. Year', 
        nextText: '下一月 | Next Month', 
        nextStatus: '显示下月<br/>Show Next Month', 
        nextBigText: '>>', 
        nextBigStatus: '显示下一年<br/>Show Next Year', 
        currentText: '今天<br/>Today', 
        currentStatus: '显示本月<br/>Current Month', 
        monthNames: ['一月','二月','三月','四月','五月','六月', '七月','八月','九月','十月','十一月','十二月'], 
        monthNamesShort: ['一月/Jan.','二月/Feb.','三月/Mar.','四月/Apr.','五月/May','六月/Jun.', '七月/Jul.','八月/Aug.','九月/Sep.','十月/Oct.','十一月/Nov.','十二月/Dec.'], 
        monthStatus: '选择月份<br/>Select Month', 
        yearStatus: '选择年份<br/>Select Year', 
        weekHeader: '周<br/>W',
        weekStatus: '年内周次', 
        dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'], 
        dayNamesShort: ['周日<br/>Sun','周一<br/>Mon','周二<br/>Tue','周三<br/>Wed','周四<br/>Thu','周五<br/>Fri','周六<br/>Sat'], 
        dayNamesMin: ['日<br/>Su','一<br/>Mo','二<br/>Tu','三<br/>We','四<br/>Th','五<br/>Fr','六<br/>Sa'], 
        dayStatus: '设置 DD 为一周起始', 
        dateStatus: '选择 m月 d日, DD', 
        dateFormat: 'yy-mm-dd', 
        firstDay: 1, 
        initStatus: '请选择日期 | Please Select Date', 
        isRTL: false
    }; 
    $.datepicker.setDefaults($.datepicker.regional['zh-CN']); 
});

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id));
}


//////////////// For Date Picker ///////////////////////

////// For nested form (copy it into form source page) ///////////////
$(function() {
    $('.datePicker').each(function() {
        $(this).datepicker({
            maxDate: "+0D",
            firstDay: 1,
            showWeek: true,
            changeMonth: true,
            changeYear: true,
            showButtonPanel: true,
            dateFormat: "yy-mm-dd"
        });
    });
});

////////////////////////////For Unlimite date//////////////////////
$(function() {
    $('.datePicker_unlimite').each(function() {
        $(this).datepicker({
            maxDate: "+2Y",
            firstDay: 1,
            showWeek: true,
            changeMonth: true,
            changeYear: true,
            showButtonPanel: true,
            dateFormat: "yy-mm-dd"
        });
    });
});

////////////////////////////////for age select//////////////////////////////

$(function() {
    $('.datePicker_age').each(function() {
        $(this).datepicker({
            yearRange: '1900:2100',
            maxDate: "+0D",
            firstDay: 1,
            showWeek: true,
            changeMonth: true,
            changeYear: true,
            showButtonPanel: true,
            dateFormat: "yy-mm-dd"
        });
    });
});

////////////////////////////For the date after today//////////////////////
$(function() {
    $('.datePicker_after_today').each(function() {
        $(this).datepicker({
            minDate: "0",
            firstDay: 1,
            showWeek: true,
            changeMonth: true,
            changeYear: true,
            showButtonPanel: true,
            dateFormat: "yy-mm-dd"
        });
    });
});

////////////// For normal use ////////////////
$(function() { // start of datepicker
    
    
    //////////////// For period report search /////////////////////////
    var ms_dates = $( "#ms_sdate, #ms_edate" ).datepicker({
        maxDate: "+0D",
        firstDay: 1,
        showWeek: true,
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        numberOfMonths: 1,
        dateFormat: "yy-mm-dd",
        onSelect: function( selectedDate ) {
            var option = this.id == "ms_sdate" ? "minDate" : "maxDate",
            instance = $( this ).data( "datepicker" ),
            date = $.datepicker.parseDate(
                instance.settings.dateFormat ||
                $.datepicker._defaults.dateFormat,
                selectedDate, instance.settings );
            ms_dates.not( this ).datepicker( "option", option, date );
        }  
    });
    ////////////// end for period report search///////////////////////////
    
    ////////////// Microsilica period report search /////////////////////////
    
    var p_dates = $( "#start_date, #end_date" ).datepicker({
        maxDate: "+0D",
        firstDay: 1,
        showWeek: true,
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        numberOfMonths: 1,
        dateFormat: "yy-mm-dd",
        onSelect: function( selectedDate ) {
            var option = this.id == "start_date" ? "minDate" : "maxDate",
            instance = $( this ).data( "datepicker" ),
            date = $.datepicker.parseDate(
                instance.settings.dateFormat ||
                $.datepicker._defaults.dateFormat,
                selectedDate, instance.settings );
            p_dates.not( this ).datepicker( "option", option, date );
        }  
    });
    
    /////////////// end of Microsilica report search ///////////////////////
    
    
    //////////////// For Charcoal Supplier Analysis Report Search /////////////////////////
    var charcoal_dates = $( "#charcoal_sdate, #charcoal_edate" ).datepicker({
        maxDate: "+0D",
        firstDay: 1,
        showWeek: true,
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        numberOfMonths: 1,
        dateFormat: "yy-mm-dd",
        onSelect: function( selectedDate ) {
            var option = this.id == "charcoal_sdate" ? "minDate" : "maxDate",
            instance = $( this ).data( "datepicker" ),
            date = $.datepicker.parseDate(
                instance.settings.dateFormat ||
                $.datepicker._defaults.dateFormat,
                selectedDate, instance.settings );
            charcoal_dates.not( this ).datepicker( "option", option, date );
        }  
    });
    ////////////// end for Charcoal Supplier Analysis Report search///////////////////////////
  
    
    /////////////// For daily report ///////////////////////////////////////
    
    $("#date").datepicker({
        maxDate: "+0D",
        firstDay: 1,
        showWeek: true,
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: "yy-mm-dd"
    //dateFormat: "d, M, yy"
    });
    
    //////////////////end of daily report////////////////
    
   
   
   
    $("#silicon_date").datepicker({
        maxDate: "+0D",
        firstDay: 1,
        showWeek: true,
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: "yy-mm-dd"
    });
    
    $("#silicon_date").datepicker({
        maxDate: "+0D",
        firstDay: 1,
        showWeek: true,
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: "yy-mm-dd"
    });
    
    $("#it_device_pdate").datepicker({
        maxDate: "+0D",
        firstDay: 1,
        showWeek: true,
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: "yy-mm-dd"
    });
   
    $("#charcoal_date").datepicker({
        maxDate: "+0D",
        firstDay: 1,
        showWeek: true,
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: "yy-mm-dd"
    });
    
    
    $("#microsilica_date").datepicker({
        maxDate: "+0D",
        firstDay: 1,
        showWeek: true,
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: "yy-mm-dd"
    });
     
    $("#sample_date").datepicker({
        maxDate: "+0D",
        firstDay: 1,
        showWeek: true,
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: "yy-mm-dd"
    });
    
    //////////////////// for customer complain form ////////////////////
    var c_dates = $( "#complain_date, #complain_trace_date" ).datepicker({
        maxDate: "+0D",
        firstDay: 1,
        showWeek: true,
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        numberOfMonths: 1,
        dateFormat: "yy-mm-dd",
        onSelect: function( selectedDate ) {
            var option = this.id == "complain_date" ? "minDate" : "maxDate",
            instance = $( this ).data( "datepicker" ),
            date = $.datepicker.parseDate(
                instance.settings.dateFormat ||
                $.datepicker._defaults.dateFormat,
                selectedDate, instance.settings );
            c_dates.not( this ).datepicker( "option", option, date );
        }  
    });
}); // End of datepicker

/////////////////////// Slide Toggle /////////////////////////////////


$(document).ready(function () {
    $('.buttons input').click( function() {
        $('.content_' + $(this).attr('class')).slideToggle("slow");
    });
});


$(function(){
    $(".datePicker").datepicker();
    $('#ui-datepicker-div').hide();
    $.datepicker._defaults.dateFormat = 'dd M yy' 
});