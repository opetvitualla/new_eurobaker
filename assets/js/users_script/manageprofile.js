$(document).ready(function () {
    var base_url = $('.base_url').val();


    $("#form_profile").submit(function (e) {

        e.preventDefault();

        confirm_alert("Are you sure to update your profile?").then(res => {

            let frmdata = $("#form_profile").serialize();

            axios.post(`${base_url}manageprofile/update_profile`, frmdata).then(res => {
                if (res.data.status == "success") {
                    s_alert("Updated Successfully!", "success");
                    setTimeout(() => {
                        window.location.reload();
                    }, 500);
                } else {
                    s_alert(res.data.message, "error");
                }
            })
        })

    })

})