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
				
				if(isset($_REQUEST['nameStudent'], $_REQUEST['fnameStudent'], $_REQUEST['birthStudent'], $_REQUEST['mailStudent'], $_REQUEST['selectClassStudent'], $_REQUEST['selectSexeStudent']))
				{
					$nameStudent = $_REQUEST['nameStudent'];
					$fnameStudent = $_REQUEST['fnameStudent'];
					$birthStudent = $_REQUEST['birthStudent'];
					$mailStudent = $_REQUEST['mailStudent'];
					$sexeStudent = $_REQUEST['selectSexeStudent'];
					$classStudent = $_REQUEST['selectClassStudent'];
					
					$sql = "INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU, NOM, NOM_CLA, PRENOM, SEXE) values (\"" . $birthStudent . "\",\"" . $mailStudent . "\",\"" . $nameStudent ."\",\"" . $classStudent . "\",\"" . $fnameStudent . "\",\"" . $sexeStudent ."\");"; 
					
					if($connexion->query($sql))
						echo "Request successfully";
					else
						echo ("Request failed");
					
					unset($_REQUEST['nameStudent'], $_REQUEST['fnameStudent'], $_REQUEST['birthStudent'], $_REQUEST['mailStudent'], $_REQUEST['selectSexeStudent'], $_REQUEST['choice'] , $_REQUEST['selectClassStudent']);
				}
				
				if(isset($_REQUEST['choice']))
				{
					$choice = $_REQUEST['choice'];
					
					switch($choice)
					{
						case "insert":
						{
							?>
								<form method="POST" action="#" name="newStudent">
									<input type="text" id="nameStudent" name="nameStudent" maxlength="20" required autofocus placeholder="Nom"/>
									<input type="text" id="fnameStudent" name="fnameStudent" maxlength="20" required placeholder="First name"/>
									<input type="date" id="birthStudent" name="birthStudent" required placeholder="Birth date"/>
									<input type="mail" id="mailStudent" name="mailStudent" required placeholder="Mail"/>
									<select name="selectClassStudent">
										<?php
											$sql = "SELECT DISTINCT NOM_NIV FROM NIVEAU";
											
											foreach($connexion->query($sql) as $row)
											{ ?>
												<optgroup label="<?php echo $row['NOM_NIV']; ?>">
												
										<?php	$secondSQL = "SELECT NOM_CLA FROM CLASSE WHERE CLASSE.NOM_NIV = " . "\"" . $row['NOM_NIV'] . "\"";
												echo $secondSQL;
												foreach($connexion->query($secondSQL) as $otherRow)
												{
													echo "<option>" . $otherRow['NOM_CLA'] . "</option>";
												} ?>
												</optgroup>
									<?php	} ?>
									</select>
									<select name="selectSexeStudent">
										<option id="male">H</option>
										<option id="female">F</option>
									</select>
									<input type ="submit" value="Submit"/>
								</form>
				<?php	}
						break;
						default:
						{
							?>
								<table>
									<tr>
										<th>NAME</th>
										<th>FIRST NAME</th>
										<th>MAIL</th>
										<th>BIRTH</th>
										<th>CLASS</th>
									</tr>
									<?php
									$sql = "SELECT NOM, PRENOM, MAIL_ETU, DATENAISS, NOM_CLA FROM ETUDIANT WHERE NOM_CLA IN (SELECT NOM_CLA FROM CLASSE WHERE NOM_NIV = '$choice');";
									
									foreach($connexion->query($sql) as $row)
									{
										echo "<tr> <td> " . $row['NOM'] ." </td> <td> " . $row['PRENOM'] . " </td> <td>" . $row['MAIL_ETU'] . " </td> <td>" . $row['DATENAISS'] . " </td> <td>" . $row['NOM_CLA'] . "</td> </tr>";
									}
									
									unset($_REQUEST['choice']);
									?>
								</table>
				<?php 	}
					}
				} else
				{ ?>
					<form method="POST" action="#" name="formChoice">
						<select name="choice" id="choice">
							<option id="insert" name="insert" value="insert">Add new student</option>
							<optgroup label="Display students from">
							<?php
								$sql = "SELECT DISTINCT NOM_NIV FROM CLASSE";
								
								if($connexion->query($sql))
								{
									foreach($connexion->query($sql) as $row)
									{ ?>
										<option value="<?php echo $row['NOM_NIV']?>"><?php echo $row['NOM_NIV']?></option> 
							<?php	}
									
								} ?>
							</optgroup>
						</select>
						<input type ="submit" value="Confirm"/>
					</form>
		<?php  	} ?>
		</section>
	</body>
	<footer>	
	</footer>
</html>