<script>
    <?php if($err=="error"): ?>
            Swal.fire({
                icon: 'error',
                text: '<?= $message?>',
            })
     <?php elseif($err=="success"): ?>
            Swal.fire({
                icon: 'success',
                text: '<?= $message?>',
            })
    <?php elseif($err=="confirm"): ?>
            Swal.fire({
                text: '<?= $message?>',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes'
                }).then((result) => {
                if (result.value) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                    })
                }
             })
     <?php endif ?>
</script>
