<div class="right-sidebar">
	<div class="row">
		<div class="col-2 d-sm-none"></div>
		<div class="col-auto my-auto">
			<button class="btn btn-light" type="button" onclick="rightsboff()">
			<i class="fa fa-bars" aria-hidden="true"></i>
			</button>
		</div>
		<div class="col-auto my-auto">
			<i class="fa fa-bell" aria-hidden="true"></i>
		</div>
		<div class="col-auto my-auto d-none">
			<div class="form-check form-switch text-center p-0">
				<label class="form-check-label" for="lightSwitch">
				<i class="fa fa-moon-o" aria-hidden="true"></i>
				</label>
				<input class="form-check-input d-none" type="checkbox" id="lightSwitch" />
			</div>

			<script>
				(function() {
					let lightSwitch = document.getElementById('lightSwitch');
					if (!lightSwitch) {
						return;
					}

					/**
					 * @function darkmode
					 * @summary: changes the theme to 'dark mode' and save settings to local stroage.
					 * Basically, replaces/toggles every CSS class that has '-light' class with '-dark'
					 */
					function darkMode() {
						document.querySelectorAll('.bg-light').forEach((element) => {
							element.className = element.className.replace(/-light/g, '-dark');
						});

						document.querySelectorAll('.link-dark').forEach((element) => {
							element.className = element.className.replace(/link-dark/, 'text-white');
						});

						document.body.classList.add('bg-dark');

						if (document.body.classList.contains('text-dark')) {
							document.body.classList.replace('text-dark', 'text-light');
						} else {
							document.body.classList.add('text-light');
						}

						// Tables
						var tables = document.querySelectorAll('table');
						for (var i = 0; i < tables.length; i++) {
							// add table-dark class to each table
							tables[i].classList.add('table-dark');
						}

						// set light switch input to true
						if (!lightSwitch.checked) {
							lightSwitch.checked = true;
						}
						localStorage.setItem('lightSwitch', 'dark');
					}

					/**
					 * @function lightmode
					 * @summary: changes the theme to 'light mode' and save settings to local stroage.
					 */
					function lightMode() {
						document.querySelectorAll('.bg-dark').forEach((element) => {
							element.className = element.className.replace(/-dark/g, '-light');
						});

						document.querySelectorAll('.text-white').forEach((element) => {
							element.className = element.className.replace(/text-white/, 'link-dark');
						});

						document.body.classList.add('bg-light');

						if (document.body.classList.contains('text-light')) {
							document.body.classList.replace('text-light', 'text-dark');
						} else {
							document.body.classList.add('text-dark');
						}

						// Tables
						var tables = document.querySelectorAll('table');
						for (var i = 0; i < tables.length; i++) {
							if (tables[i].classList.contains('table-dark')) {
								tables[i].classList.remove('table-dark');
							}
						}

						if (lightSwitch.checked) {
							lightSwitch.checked = false;
						}
						localStorage.setItem('lightSwitch', 'light');
					}

					/**
					 * @function onToggleMode
					 * @summary: the event handler attached to the switch. calling @darkMode or @lightMode depending on the checked state.
					 */
					function onToggleMode() {
						if (lightSwitch.checked) {
							darkMode();
						} else {
							lightMode();
						}
					}

					/**
					 * @function getSystemDefaultTheme
					 * @summary: get system default theme by media query
					 */
					function getSystemDefaultTheme() {
						const darkThemeMq = window.matchMedia('(prefers-color-scheme: dark)');
						if (darkThemeMq.matches) {
							return 'dark';
						}
						return 'light';
					}

					function setup() {
						var settings = localStorage.getItem('lightSwitch');
						if (settings == null) {
							settings = getSystemDefaultTheme();
						}

						if (settings == 'dark') {
							lightSwitch.checked = true;
						}

						lightSwitch.addEventListener('change', onToggleMode);
						onToggleMode();
					}

					setup();
				})();
			</script>

			<!-- //////////////////////////////////// -->
		</div>
		<div class="col text-end">
			<ul class="p-0">
				<?php

				$reid = $_SESSION['reid'];

				$stmt = $DB_con->prepare('SELECT * FROM lmsregister where reid="' . $reid . '"');

				$stmt->execute();

				if ($stmt->rowCount() > 0) {

					while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

						extract($row);

						$reg_id = $row["contactnumber"];

				?>
						<li class="ui dropdown">
							<a href="#" class="opts_account p-0" onclick="toggleDisplay()" type="button" title="Account">
								<?php if ($row['image'] == "") {
									$pro_img = "images/hd_dp.jpg";
								} else {
									$pro_img = "uploadImg/" . $row['image'];
								} ?>
								<div class="row bg-light">
									<div class="col-5"><img class="m-0" src="<?php echo $pro_img; ?>" style="object-fit: cover;"></div>
									<div class="col-7 my-auto text-dark">
										<p class="fw-bold"><?php echo $row['fullname']; ?> <i class="fa fa-sort-desc align-top" aria-hidden="true"></i></p>
									</div>
								</div>
							</a>
							<div class="menu dropdown_account" id="dropdown">
								<div class="channel_my">
									<div class="profile_link"> <?php if ($row['image'] == "") {
																	$pro_img = "images/hd_dp.jpg";
																} else {
																	$pro_img = "uploadImg/" . $row['image'];
																} ?><img src="<?php echo $pro_img; ?>" style="object-fit: cover;">
										<div class="pd_content">
											<div class="rhte85">
												<h6><?php echo $row['fullname']; ?></h6>
												<div class="mef78" title="Verify"> <i class='uil uil-check-circle'></i> </div>
											</div>
											<span><?php echo "0" . (int)$row['contactnumber']; ?></span>
										</div>
									</div> <a href="../index.php" class="dp_link_12">Go Home Page</a>
								</div>
								<div class="night_mode_switch__btn">
									<a href="#" id="night-mode" class="btn-night-mode"> <i class="uil uil-moon"></i> Night mode <span class="btn-night-mode-switch">
											<span class="uk-switch-button"></span></span>
									</a>
								</div> <a href="bank_payment.php" class="item channel_item">Bank Payment</a> <a href="card_payment.php" class="item channel_item">Card Payment</a> <a href="manual_payment.php" class="item channel_item">Manual Payment</a> <a href="reviews.php" class="item channel_item">Reviews</a> <a href="../logout.php" class="item channel_item">Logout</a>
							</div>
						</li>


				<?php

					}
				}

				?>
			</ul>
		</div>
	</div>

	<div class="r-sb-sec">
	<div class="cal-sec py-3">
		<div class="card bg-light border-0">
			<div class="card-body px-0">
				<!-- <div class="row">
					<div class="col-5 my-auto">
						
					</div>
					<div class="col-7">
						<div class="d-flex justify-content-end">
							<button class="mx-2 border-0 bg-white text-secondary" type="button">June 2023 <i class="fa fa-sort-desc align-top" aria-hidden="true"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="mt-4">
					<table class="table table-borderless text-center">
						<thead>
							<tr>
								<th>Mo</th>
								<th>Tu</th>
								<th>We</th>
								<th>Th</th>
								<th>Fr</th>
								<th>Sa</th>
								<th>Su</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><span>1</span></td>
								<td><span>2</span></td>
								<td><span class="bg-primary text-light">3</span></td>
								<td><span>4</span></td>
								<td><span>5</span></td>
								<td><span>6</span></td>
								<td><span>7</span></td>
							</tr>
							<tr>
								<td><span>8</span></td>
								<td><span>9</span></td>
								<td><span>10</span></td>
								<td><span>11</span></td>
								<td><span class="bg-success text-light">12</span></td>
								<td><span>13</span></td>
								<td><span>14</span></td>
							</tr>
							<tr>
								<td><span class="bg-warning text-light">15</span></td>
								<td><span>16</span></td>
								<td><span>17</span></td>
								<td><span>18</span></td>
								<td><span>19</span></td>
								<td><span>20</span></td>
								<td><span>21</span></td>
							</tr>
							<tr>
								<td><span>22</span></td>
								<td><span>23</span></td>
								<td><span>24</span></td>
								<td><span>25</span></td>
								<td><span>26</span></td>
								<td><span class="bg-danger text-light">27</span></td>
								<td><span>28</span></td>
							</tr>
							<tr>
								<td><span>29</span></td>
								<td><span>30</span></td>
								<td><span>31</span></td>

							</tr>
						</tbody>
					</table>

				</div> -->
				<p class="fw-bold position-absolute mt-2 ms-3 d-md-none d-lg-none d-xl-block">My Progress</p>
				<div id="calendar" class="calendar"></div>
			</div>
		</div>
	</div>
	<div class="upc-act">
		<div class="card bg-light border-0">
			<div class="card-body">
				<div class="row">
					<div class="col-8">
						<p class="h6">Upcomig Activities</p>
					</div>
					<div class="col-4 text-end">
						<a class="" href="">See all</a>
					</div>
				</div>
			</div>
		</div>
		<div class="card border-0 mb-4 bg-primary bg-opacity-10">
			<div class="card-body">
				<div class="row">
					<div class="col-auto my-auto">
						<div class="bg-primary rounded-circle text-center text-light sq-box">
							<h2>8</h2>
						</div>
					</div>
					<div class="col">
						<a href="">
							<p class="fw-bold mb-0">Adv. Maths Assignment Due <i class="fa fa-angle-right ms-3" aria-hidden="true"></i>
							</p>
						</a>
						<p class="small">8th - 10th July 2023 8 A.M - 9 A.M Online Zoom Session</p>
					</div>
				</div>
			</div>
		</div>
		<div class="card border-0 mb-4 bg-danger bg-opacity-10">
			<div class="card-body">
				<div class="row">
					<div class="col-auto my-auto">
						<div class="bg-danger rounded-circle text-center text-light sq-box">
							<h2>13</h2>
						</div>
					</div>
					<div class="col">
						<a href="">
							<p class="fw-bold mb-0">Adv. Maths Assignment Due <i class="fa fa-angle-right ms-3" aria-hidden="true"></i>
							</p>
						</a>
						<p class="small">8th - 10th July 2023 8 A.M - 9 A.M Online Zoom Session</p>
					</div>
				</div>
			</div>
		</div>
		<div class="card border-0 mb-4 bg-success bg-opacity-10">
			<div class="card-body">
				<div class="row">
					<div class="col-auto my-auto">
						<div class="bg-success rounded-circle text-center text-light sq-box">
							<h2>18</h2>
						</div>
					</div>
					<div class="col">
						<a href="">
							<p class="fw-bold mb-0">Adv. Maths Assignment Due <i class="fa fa-angle-right ms-3" aria-hidden="true"></i>
							</p>
						</a>
						<p class="small">8th - 10th July 2023 8 A.M - 9 A.M Online Zoom Session</p>
					</div>
				</div>
			</div>
		</div>
		<div class="card border-0 mb-4 bg-warning bg-opacity-10">
			<div class="card-body">
				<div class="row">
					<div class="col-auto my-auto">
						<div class="bg-warning rounded-circle text-center text-light sq-box">
							<h2>23</h2>
						</div>
					</div>
					<div class="col">
						<a href="">
							<p class="fw-bold mb-0">Adv. Maths Assignment Due <i class="fa fa-angle-right ms-3" aria-hidden="true"></i>
							</p>
						</a>
						<p class="small">8th - 10th July 2023 8 A.M - 9 A.M Online Zoom Session</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>

<script>
	// Calender section script
	document.addEventListener("DOMContentLoaded", function() {
		var calendar = document.getElementById("calendar");

		// Get current date
		var currentDate = new Date();

		// Render calendar
		renderCalendar(currentDate);

		function renderCalendar(date) {
			var year = date.getFullYear();
			var month = date.getMonth();
			var firstDay = new Date(year, month, 1);
			var lastDay = new Date(year, month + 1, 0);
			var daysInMonth = lastDay.getDate();

			// Clear calendar
			calendar.innerHTML = "";

			// Render header
			var header = document.createElement("div");
			header.classList.add("header");

			var prevBtn = document.createElement("span");
			prevBtn.classList.add("prev");
			prevBtn.textContent = "<";
			prevBtn.addEventListener("click", function() {
				renderCalendar(new Date(year, month - 1, 1));
			});
			header.appendChild(prevBtn);

			var monthLabel = document.createElement("span");
			monthLabel.classList.add("month");
			monthLabel.textContent = new Intl.DateTimeFormat("en-US", {
				month: "long",
				year: "numeric"
			}).format(date);
			header.appendChild(monthLabel);

			var nextBtn = document.createElement("span");
			nextBtn.classList.add("next");
			nextBtn.textContent = ">";
			nextBtn.addEventListener("click", function() {
				renderCalendar(new Date(year, month + 1, 1));
			});
			header.appendChild(nextBtn);

			calendar.appendChild(header);

			// Render weekdays
			var weekdays = document.createElement("div");
			weekdays.classList.add("weekdays");
			var weekdaysArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
			for (var i = 0; i < weekdaysArray.length; i++) {
				var weekday = document.createElement("div");
				weekday.classList.add("weekday");
				weekday.textContent = weekdaysArray[i];
				weekdays.appendChild(weekday);
			}
			calendar.appendChild(weekdays);

			// Render days
			var days = document.createElement("div");
			days.classList.add("days");
			var day = 1;
			var firstDayIndex = firstDay.getDay();
			for (var i = 0; i < 42; i++) {
				var dayCell = document.createElement("div");
				dayCell.classList.add("day");
				if (i >= firstDayIndex && day <= daysInMonth) {
					dayCell.textContent = day;
					if (year === currentDate.getFullYear() && month === currentDate.getMonth() && day === currentDate.getDate()) {
						dayCell.classList.add("current-month");
					}
					day++;
				}
				days.appendChild(dayCell);
			}
			calendar.appendChild(days);
		}
	});
</script>