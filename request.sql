SELECT plat.id as platId, plat.nom, commande.date as commandeDate
FROM plat
INNER JOIN plat_commande ON plat_commande.plat_id = plat.id
INNER JOIN commande ON plat_commande.commande_id = commande.id
WHERE commande.id = 1
