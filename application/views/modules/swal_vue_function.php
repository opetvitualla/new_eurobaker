<script>
    function confirm_alert(msg){
        return new Promise((resolve, reject) =>{
            Swal.fire({
                icon: "warning",
                text: msg,
                showCancelButton: true,
                confirmButtonColor: '#000616',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes'
            }).then((result) => {
                if (result.value) {
                    resolve(200)
                }
            })
        }) 
    }
    function  s_alert(msg, icons){
        Swal.fire({ icon:icons, text:msg })
    }
</script>