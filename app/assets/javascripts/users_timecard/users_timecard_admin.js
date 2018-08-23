$('.users.show').ready(function(){
    console.log("Hello World");
    var notify_tooltip_options = {
        enterDelay: 300
    };
    var notify_tooltip = document.querySelector('#notify_btn_tt');
    var notify_tooltip_instance = M.Tooltip.init(notify_tooltip , notify_tooltip_options);
    var collect_tooltip_options = {
        enterDelay: 300
    };
    var collect_tooltip = document.querySelector('#collect_btn_tt');
    var collect_tooltip_instance = M.Tooltip.init(collect_tooltip , collect_tooltip_options);

    var collect_modal_options = {};
    var collect_modal = document.querySelector('#collect_hours_modal');
    var collect_modal_instance = M.Modal.init(collect_modal, collect_modal_options);

    var notify_button_tt = $("#notify_btn_tt");
    notify_button_tt.click(function () {
        $("#manager_action_progress").removeClass("hiddendiv");
        $.ajax({
            url: "/organizations/" + notify_button_tt.data("organization_id") + "/notify_users_timecards_are_due",
            type: "POST",
            success: function () {
                $("#manager_action_progress").addClass("hiddendiv");
                M.toast({html: 'Notified Users', displayLength: "8000"});
            }
        });
    });

    $("#collect_btn_tt").click(function () {
        collect_modal_instance.open();
    });

    var accept_and_collect = $("#accept_and_collect");

    accept_and_collect.click(function(){
        $("#manager_action_progress").removeClass("hiddendiv");
        $.ajax({
            url: "/organizations/" + accept_and_collect.data("organization_id") + "/collect_timecards",
            type: "POST",
            success: function (json) {
                $("#manager_action_progress").addClass("hiddendiv");
                M.toast({html: json["message"], displayLength: "8000"});
                location.reload();
            }
        });
    });
});