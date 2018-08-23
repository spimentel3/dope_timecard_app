$('.users.show, .timecard.edit').ready(function() {
    var locked = false;

    $(function () {
        if ($("#timecard_lock").html() === "lock") {
            lock_timecard();
            locked = true;
        }
    });

    $("#btn_clear").click(function () {
        if (!locked) {
            $('#sat_start_hour').val("");
            $('#sat_start_minute').val("");
            $('#sat_end_hour').val("");
            $('#sat_end_minute').val("");
            $('#sat_break_hour').val("");
            $('#sat_break_minute').val("");

            $('#sun_start_hour').val("");
            $('#sun_start_minute').val("");
            $('#sun_end_hour').val("");
            $('#sun_end_minute').val("");
            $('#sun_break_hour').val("");
            $('#sun_break_minute').val("");

            $('#mon_start_hour').val("");
            $('#mon_start_minute').val("");
            $('#mon_end_hour').val("");
            $('#mon_end_minute').val("");
            $('#mon_break_hour').val("");
            $('#mon_break_minute').val("");

            $('#tue_start_hour').val("");
            $('#tue_start_minute').val("");
            $('#tue_end_hour').val("");
            $('#tue_end_minute').val("");
            $('#tue_break_hour').val("");
            $('#tue_break_minute').val("");

            $('#wed_start_hour').val("");
            $('#wed_start_minute').val("");
            $('#wed_end_hour').val("");
            $('#wed_end_minute').val("");
            $('#wed_break_hour').val("");
            $('#wed_break_minute').val("");

            $('#thu_start_hour').val("");
            $('#thu_start_minute').val("");
            $('#thu_end_hour').val("");
            $('#thu_end_minute').val("");
            $('#thu_break_hour').val("");
            $('#thu_break_minute').val("");

            $('#fri_start_hour').val("");
            $('#fri_start_minute').val("");
            $('#fri_end_hour').val("");
            $('#fri_end_minute').val("");
            $('#fri_break_hour').val("");
            $('#fri_break_minute').val("");

            $('.am-btn').removeClass("animate_theia_text_blue");
            $('.pm-btn').removeClass("animate_theia_text_blue");

            clear_timecard();
        }
    });

    $("#timecard_table input").focusout(function () {
        if (this.value != "")
            this.value = zero_pad(this.value, 2);
    });


    $("#timecard_table input[id*='hour']").focusout(function () {
        if (this.value !== "") {
            if ($(this).hasClass("start_hour"))
                toggle_am_pm($(this).siblings("div[id*='am_pm']").children(".am-btn"));
            else if ($(this).hasClass("end_hour"))
                toggle_am_pm($(this).siblings("div[id*='am_pm']").children(".pm-btn"));
        } else {
            $(this).parent().find(".am-btn").removeClass("animate_theia_text_blue");
            $(this).parent().find(".pm-btn").removeClass("animate_theia_text_blue");
        }
    });

    $("#timecard_table input, input#sick_hours_input").focusout(function () {
        // console.log("Updating");
        update_timecard();
    });

    $(".am-btn").click(function () {
        if (!locked) {
            toggle_am_pm($(this));
            update_timecard();
        }
    });

    $(".pm-btn").click(function () {
        if (!locked) {
            toggle_am_pm($(this));
            update_timecard();
        }
    });

    $(".copy_time_down").click(function () {
        if (!locked) {
            copy_row_to_next_day(this);
        }
    });

    var timecard_lock = $("#timecard_lock");
    timecard_lock.click(function () {
        if (timecard_lock.html() === "lock_open") {
            $.ajax({
                type: 'GET'
                , url: '/timecard/' + timecard_lock.data("timecard_id") + '/lock'
                , success: function () {
                    timecard_lock.html("lock");
                    lock_timecard();
                }
                , error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log('Upload error: ' + XMLHttpRequest.responseText);
                }
            });
        } else {
            $.ajax({
                type: 'GET'
                , url: '/timecard/' + timecard_lock.data("timecard_id") + '/unlock'
                , success: function () {
                    timecard_lock.html("lock_open");
                    unlock_timecard();
                }
                , error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log('Upload error: ' + XMLHttpRequest.responseText);
                }
            });
        }
    });

    function zero_pad(n, width, z) {
        z = z || '0';
        n = n + '';
        return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
    }

    function toggle_am_pm(elem) {
        $(elem).addClass("animate_theia_text_blue");
        $(elem).siblings().removeClass("animate_theia_text_blue");
    }

    function lock_timecard() {
        $("input").attr("disabled", true);
        locked = true;
    }

    function unlock_timecard() {
        $("input").removeAttr("disabled");
        locked = false
    }

    function copy_row_to_next_day(elem) {
        var start_hour = $(elem).parent().find("input.start_hour").val();
        var start_min = $(elem).parent().find("input.start_min").val();
        var start_am_pm = $(elem).parent().find("input.start_hour").parent().find(".pm-btn.animate_theia_text_blue").length;
        var end_hour = $(elem).parent().find("input.end_hour").val();
        var end_min = $(elem).parent().find("input.end_min").val();
        var end_am_pm = $(elem).parent().find("input.end_hour").parent().find(".pm-btn.animate_theia_text_blue").length;
        var break_hour = $(elem).parent().find("input.break_hour").val();
        var break_min = $(elem).parent().find("input.break_min").val();

        var next = $(elem).parent().next();

        // console.log(next.find("input.start_hour").parent().find(".pm-btn").length);

        next.find("input.start_hour").val(start_hour);
        next.find("input.start_min").val(start_min);
        if (start_am_pm) {
            var pm_ele = next.find("input.start_hour").parent().find(".pm-btn");
            var am_ele = next.find("input.start_hour").parent().find(".am-btn");
            am_ele.removeClass("animate_theia_text_blue");
            pm_ele.addClass("animate_theia_text_blue");
        } else {
            var pm_ele = next.find("input.start_hour").parent().find(".pm-btn");
            var am_ele = next.find("input.start_hour").parent().find(".am-btn");
            pm_ele.removeClass("animate_theia_text_blue");
            am_ele.addClass("animate_theia_text_blue");
        }
        next.find("input.end_hour").val(end_hour);
        next.find("input.end_min").val(end_min);
        if (end_am_pm) {
            next.find("input.end_hour").parent().find(".pm-btn").addClass("animate_theia_text_blue");
        } else {
            next.find("input.end_hour").parent().find(".am-btn").addClass("animate_theia_text_blue");
        }
        next.find("input.break_hour").val(break_hour);
        next.find("input.break_min").val(break_min);
        update_timecard();
    }

});