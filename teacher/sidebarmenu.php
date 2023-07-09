<div class="main_logo w-100 text-center" id="logo">
	<a href="<?php echo $url; ?>teacher/home.php"><img class="w-100 p-3" src="../super_admin/settings/logo/<?php echo $main_logo; ?>" alt=""></a>
</div>
<div class="nav-control text-end">
	<div class="hamburger pe-1">
		<span class="line"></span><span class="line"></span><span class="line"></span>
	</div>
</div>
<ul class="metismenu" id="menu">
	<li>
		<a href="home.php" aria-expanded="false">
			<i class="la la-home"></i>
			<span class="nav-text">Dashboard</span>
		</a>
	</li>
	<li>
		<a href="class_schedule.php" aria-expanded="false">
			<i class="la la-slideshare"></i>
			<span class="nav-text">Class Schedule</span>
		</a>
	</li>
	<li>
		<a href="class_tute.php" aria-expanded="false">
			<i class="la la-book"></i>
			<span class="nav-text">Class Tute</span>
		</a>
	</li>
	<!-- <li>
		<a href="video_lessons.php" aria-expanded="false">
			<i class="la la-play-circle-o"></i>
			<span class="nav-text">Video Lessons</span>
		</a>
	</li> -->
	<li>
		<a href="attendence.php" aria-expanded="false">
			<i class="la la-file-text"></i>
			<span class="nav-text">Students Attendence</span>
		</a>

	</li>
	<li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
			<i class="la la-leanpub"></i>
			<span class="nav-text">Mcq Exams</span>
		</a>
		<ul aria-expanded="false">
			<li><a href="exam.php">Exam Details</a></li>
			<li><a href="exam_results.php">Exam Results</a></li>
		</ul>
	</li>
	<li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
			<i class="la la-leanpub"></i>
			<span class="nav-text">Verbal Exams</span>
		</a>
		<ul aria-expanded="false">
			<li><a href="verbal.php">Verbal Exams Details</a></li>

		</ul>
	</li>
	<li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
			<i class="la la-leanpub"></i>
			<span class="nav-text">Course Works</span>
		</a>
		<ul aria-expanded="false">
			<li><a href="course_work.php">Add Course Work</a></li>
			<li><a href="course_work_submissions.php">Student Submitted Course Work</a></li>
		</ul>
	</li>
	<li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
			<i class="la la-money"></i>
			<span class="nav-text">Payments</span>
		</a>
		<ul aria-expanded="false">
			<li><a href="payment_list.php?type=Manual">Manual Payments</a></li>
			<li><a href="payment_list.php?type=Bank">Bank Payments</a></li>
			<li><a href="payment_list.php?type=Card">Online Payments</a></li>
		</ul>
	</li>
	<li>
		<a href="logout.php" aria-expanded="false">
			<i class="la la-sign-out"></i>
			<span class="nav-text">Log Out</span>
		</a>
	</li>
</ul>