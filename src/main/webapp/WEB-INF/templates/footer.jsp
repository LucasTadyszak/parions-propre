    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value="https://code.jquery.com/jquery-3.2.1.slim.min.js" />" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" />" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" />" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



    <!-- Page level plugin JavaScript-->

    <script src="<c:url value="https://cdn.jsdelivr.net/npm/sweetalert2@9/dist/sweetalert2.min.js" />"></script>
    <script src="<c:url value="/public/vendor/chart.js/Chart.min.js" />"></script>
    <script src="<c:url value="/public/vendor/datatables/jquery.dataTables.js" />"></script>
    <script src="<c:url value="/public/vendor/datatables/dataTables.bootstrap4.js" />"></script>
    <script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/imask/5.2.1/imask.min.js" />"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value="/public/js/sb-admin.min.js" />"></script>


    <script>
        $(document).ready(function(){
            $('#myModal').modal('show');
        });
    </script>
    <script type="text/javascript">
        var dateMask = IMask(
            document.getElementById('naissance'),
            {
                mask: Date,
                pattern: 'Y-m-dd',
                min: new Date(1900, 0, 1),
                max: new Date(2020, 0, 1),
            });
    </script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#connected').fire({
                title: 'Error!',
                text: 'Do you want to continue',
                icon: 'error',
                confirmButtonText: 'Cool'
            })
        });
    </script>
    </body>
</html>