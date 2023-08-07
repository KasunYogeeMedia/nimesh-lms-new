<?php
include '../super_admin/conn.php';
?>

<footer class="footer bg-secondary">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="footer_bottm">
					<div class="row">
						<div class="col-md-12">
							<ul class="fotb_left">
								<li>
									<p class="text-light"> Copyrights 2021
										© <?php echo $application_name; ?> | Website by <a class="text-light" target="_blank" title="Click to visit" href="https://yogeemedia.com/">yogeemedia.com</a></p>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>

<!-- Logout Confirmation Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="logoutModalLabel">Confirm Logout</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				Are you sure you want to logout?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
				<a href="../logout.php" class="btn btn-primary">Logout</a>
			</div>
		</div>
	</div>
</div>

<!-- <footer class="footer mt-40 bg-secondary">
	<div class="text-center">
		<p class="text-light"> Copyrights 2021
			© <?php echo $application_name; ?> | Website by <a class="text-light" target="_blank" title="Click to visit" href="https://yogeemedia.com/">yogeemedia.com</a></p>
	</div>
</footer> -->