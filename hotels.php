<?php
require("config.php");

$stmt = $pdo->prepare("SELECT * FROM hotels");
$stmt->execute();
$hotels = $stmt->fetchAll();








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

             <div class="hotels">


             <?php foreach($hotels as $hotel){ ?>
             <div class="carte">

                <img src="<?php echo htmlspecialchars($hotel['image_hotel']); ?>" alt="<?php echo htmlspecialchars($hotel['nom_hotel']); ?>">
                <div class="info">
                    <h2> <?php echo htmlspecialchars($hotel['nom_hotel']); ?> </h2>
                    <p> Adresse : <?php echo htmlspecialchars($hotel['address_hotel']); ?> </p>
                    <p> Description : <?php echo htmlspecialchars($hotel['description_hotel']); ?> </p>
                    <p> Prix : <?php echo htmlspecialchars($hotel['prix']); ?> €</p>
                    <p> Étoile : <?php echo htmlspecialchars($hotel['etoile']); ?>/5 ⭐</p>
                    

                    <form action="reservation.php" method="POST">
                        <input type="hidden" name="nomH" value="<?php echo htmlspecialchars($hotel['nom_hotel']); ?>">
                        <input type="hidden" name="idH" value="<?php echo htmlspecialchars($hotel['id_hotel']); ?>">
                        <button type="submit">Réserver</button>
                    </form>
                    
                </div>

             </div>

             <?php } ?>



            </div>

           
            

        </main>
         
            <?php require('footer.php')  ?>
 
    </div>



<script>



</script>
</body>
</html>