<?php

if (!isset($_SESSION)) {
    session_start();
}

session_unset();

session_destroy();

echo "<script>
window.location = 'https://ipdedulk.com/admin/';
</script>
";


