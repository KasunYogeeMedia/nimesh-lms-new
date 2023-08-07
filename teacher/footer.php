<?php
include '../super_admin/conn.php';

?>

<!--**********************************
            Footer start
        ***********************************-->
<div class="footer">
    <div class="copyright">
        <p>
            Copyrights <span id="getYear">2021</span>
            © <?php echo $application_name; ?> | Website by <a target="_blank" title="Click to visit" href="https://yogeemedia.com/">yogeemedia.com</a>
        </p>
    </div>
</div>
<!--**********************************
            Footer end
        ***********************************-->

<!-- Logout Confirmation Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="logoutModalLabel">Confirm Log Out</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to log out?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <a href="logout.php" class="btn btn-primary">Log Out</a>
            </div>
        </div>
    </div>
</div>