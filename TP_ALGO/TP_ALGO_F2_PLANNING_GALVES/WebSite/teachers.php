<?php 
	require_once('connect.php');
?>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Carnet de journal de papier</title>
		<link rel="stylesheet" type="text/css" href="font.css" />
		</script>
	</head>
	<body>
		<header>
			<h1>HELLO WORLD ! </h1>
		</header>
		<nav>
			<?php require_once('nav.php'); ?>
		</nav>
		<section>
			<?php
				
				$dsn = "mysql:dbname=".BASE.";host=".SERVER;
				try
				{
					$connexion = new PDO($dsn, USER, PASSWORD);
				}
				catch(PDOException $exception)
				{
					printf("Echec de la connexion : %s\n", $exception->getMessage());
					exit();
				}
				
				if(isset($_REQUEST['nameTeacher'], $_REQUEST['fnameTeacher'], $_REQUEST['birthTeacher'], $_REQUEST['mailTeacher'], $_REQUEST['sexeTeacher']))
				{
					$nameTeacher = $_REQUEST['nameTeacher'];
					$fnameTeacher = $_REQUEST['fnameTeacher'];
					$birthTeacher = $_REQUEST['birthTeacher'];
					$mailTeacher = $_REQUEST['mailTeacher'];
					$sexeTeacher = $_REQUEST['sexeTeacher'];
					
					$sql = "INSERT INTO ENSEIGNANT (DATENAISS_ENS, MAIL_ENS, NOM_ENS, PRENOM_ENS, SEXE_ENS) values (\"" . $birthTeacher . "\",\"" . $mailTeacher . "\",\"" . $nameTeacher ."\",\"" . $fnameTeacher . "\",\"" . $sexeTeacher ."\");"; 
					
					if($connexion->query($sql))
						echo "Request successfully";
					else
						echo ("Request failed");
					
					unset($_REQUEST['nameTeacher'], $_REQUEST['fnameTeacher'], $_REQUEST['birthTeacher'], $_REQUEST['mailTeacher'], $_REQUEST['sexeTeacher'], $_REQUEST['choice']);
				}
				
				if(isset($_REQUEST['choice']))
				{
					$choice = $_REQUEST['choice'];
					
					switch($choice)
					{
						case "insert":
						{
							?>
							<form method="POST" action="#" name="formTeacher">
								<input type="text" id="nameTeacher" name="nameTeacher" maxlength="20" required autofocus placeholder="Nom"/>
								<input type="text" id="fnameTeacher" name="fnameTeacher" maxlength="20" required placeholder="First name"/>
								<input type="date" id="birthTeacher" name="birthTeacher" required placeholder="Birth date"/>
								<input type="mail" id="mailTeacher" name="mailTeacher" required placeholder="Mail"/>
								<select name="sexeTeacher">
									<option id="male">H</option>
									<option id="female">F</option>
								</select>
								<input type ="submit" value="Confirm"/>
							</form>
					<?php	}
						break; ?>
						
						
				<?php	case "select":
						{ 
							unset($_REQUEST['choice']);
							?>
							<table>
								<tr>
									<th>NOM</th>
									<th>PRENOM</th>
									<th>MAIL</th>
								</tr>
								<?php
								
									$sql = "SELECT * from ENSEIGNANT";
									
									foreach($connexion->query($sql) as $row)
									{
										echo "<tr> <td> " . $row['NOM_ENS'] ." </td> <td> " . $row['PRENOM_ENS'] . " </td> <td>" . $row['MAIL_ENS'] . " </td> </tr>";
									}
								?>
							</table>
				<?php	}
						break; ?>
						
				<?php	default:
						break; 
					}		
				} else
				{ ?>
					<form method="POST" action="#" name="formChoice">
						<select name="choice" id="choice">
							<option id="insert" name="insert" value="insert">Add new teacher</option>
							<option id="select" name="select" value="select">Display teachers</option>
						</select>
						<input type ="submit" value="Confirm"/>
					</form>
		<?php  	} ?>
		</section>
	</body>
	<footer>	
	</footer>
</html>