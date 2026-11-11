<?php
require("config.php");


$stmt = $pdo->prepare("SELECT * FROM hotels");
$stmt->execute();
$hotels = $stmt->fetchAll();

$nom = $_POST['nom'] ?? "";
$email = $_POST['email'] ?? "";
$id_hotel =  $_POST['hotel'] ?? $_POST['idH'] ?? "";
$dateD = $_POST['dateD'] ?? "";
$dateF = $_POST['dateF'] ?? "";




?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Application booKing</title>
    <link rel="icon" href="data:,">
    <link rel="stylesheet" href="style.css">

</head>
<body>
    
    <div class="wrapper">
  <?php require('header.php') ?>

        
        <main>

             <div class="réservation">

                <form action="" method="POST">


                <div class="form">
                <label for="nom">Nom :</label>
                <input id="nom" name="nom" type="text" placeholder="John" autocomplete="name" required>
                
                <label for="email">E-mail :</label>
                <input id="email" name="email" type="email" placeholder="John@gmail.com" autocomplete="email" required>
                </div>

                <div class="form">
                <label for="hotel">Nom de l'hôtel :</label>
                <select id="hotel" name="hotel" required>

            <?php foreach ($hotels as $hotel) { ?>

            <option
                value="<?= $hotel['id_hotel'] ?>"
                <?= ($hotel['id_hotel'] == $id_hotel) ? 'selected' : '' ?>>
                <?=  htmlspecialchars($hotel['nom_hotel']) ?>
            </option>

                <?php } ?>

                </select> <br>

                


                <label for="dateD">Date de début de réservation :</label> 
                <input id="dateD" name="dateD" type="date" required> <br>
                
                <label for="dateF">Date de fin de réservation :</label>
                <input id="dateF" name="dateF" type="date" required>
                </div>

                <button name="btn" type="submit">Réserver</button>
            </form>

            
     <?php      
      if(isset($_POST['btn'])){ 

    class booking{

         private $nom;
        private $email;
        private $id_hotel;
        private $dateD;
        private $dateF;

    function __construct($nom, $email, $id_hotel, $dateD, $dateF){

    $this->nom = $nom;
    $this->email = $email;
    $this->id_hotel = $id_hotel;
    $this->dateD = $dateD;
    $this->dateF = $dateF;

    }

        public function getNom(){
        return $this->nom;
        }
        public function getEmail(){
        return $this->email;
        }
        public function getId_hotel(){
        return $this->id_hotel;
        }
        public function getDateD(){
        return $this->dateD;
        }
        public function getDateF(){
        return $this->dateF;
        }

};
            
            $booking = new booking($nom, $email, $id_hotel, $dateD, $dateF);

            if ($booking->getDateD() >= $booking->getDateF()) { ?>
            <h2> La date de fin doit être après la date de début. </h2>
            <?php } else {

            $stmt = $pdo->prepare("SELECT id_chambre FROM chambres WHERE id_hotel = :id_hotel AND id_chambre NOT IN (SELECT id_chambre FROM booking WHERE dateD < :dateF AND dateF > :dateD) ORDER BY id_chambre ASC");
            $stmt->execute([':id_hotel' => $booking->getId_hotel(), ':dateD' => $booking->getDateD(), ':dateF' => $booking->getDateF() ]);
            $chambresDispo = $stmt->fetchAll(PDO::FETCH_COLUMN);

            if($chambresDispo){

            $id_chambre = $chambresDispo[0];
            $ajout_client = false;
            $reservation_client = false;

            $pdo->beginTransaction();
            try{

             $stmt = $pdo->prepare("INSERT INTO clients(nom, email) VALUES (?, ?) ");
             $ajout_client = $stmt->execute([ $booking->getNom(), $booking->getEmail() ]);

             $id_client = $pdo->lastInsertId();

             $stmt = $pdo->prepare("INSERT INTO booking(id_client, id_hotel, id_chambre, dateD, dateF) VALUES (?, ?, ?, ?, ?) ");
             $reservation_client = $stmt->execute([ $id_client, $booking->getId_hotel(), $id_chambre, $booking->getDateD(), $booking->getDateF() ]);
            
             $pdo->commit();
            } catch (PDOException $e) {
                $pdo->rollBack();
            }

             if($ajout_client && $reservation_client){ ?>
             <h2> Réservation réussie ! Votre numéro de chambre est : <?php echo htmlspecialchars($id_chambre); ?> </h2> 
             
            <?php
            }else{ ?>
                 <h2>Une erreur est survenue lors de la réservation. </h2>
            <?php
            }

                 }else{
                  ?>  <h2> Pas de disponibilité pour cette période.  </h2> <?php
                 }
            }
            }
   
         ?>

   
        </div>

            
          

        </main>

        
            <?php require('footer.php')  ?>

    </div>




</body>
</html>