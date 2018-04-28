			const
				nb_combi = 4;
				nb_essais = 7;
			var 
				combi = ["nb1", "nb2","nb3","nb4"],entree = ["nb1", "nb2","nb3","nb4"],cows,bulls,essais,fin,score;
			
			
			window.onload = function()
			/*
			Fonction qui est appelée lors du chargement de la page, score (variable globale) mise à 0 et appel de la Fonction GenerRandom
			*/
			{
				score=0;
				GenerRandom();
			}
			
			function VerifErreur(t_combi){
			/*
			Vérifier si une combinaison ( tableau de 4 entiers ) comporte deux fois le même chiffre. 
			Entrées: Combinaison
			Sorties: Fonction retournant le booléen du test
			*/
				var i,j,test;
				
				test=false;
				for (i = 0; i < nb_combi; i++)
				{
					for (j = 0; j < nb_combi; j++)
					{
						if ((t_combi[i]==t_combi[j]) && (i!=j))
						{
							test=true;
						}
					}
				}
				return test;
			}
			
			function GenerRandom(){
			/*
			Appel de la fonction Raz suivi de la génération d'une combinaison de 4 chiffres différents aléatoires. Préparer les dispositions d'une nouvelle partie (essais mise à 7)
			Entrées: Variable globale combi ( tableau d'entiers ), essais
			Sorties: Appel fonction Raz, et assignation variable globale combi
			*/
				Raz();
				do
				{
					combi[0] = Math.floor((Math.random()*9)+1);
					combi[1] = Math.floor((Math.random()*9)+1);
					combi[2] = Math.floor((Math.random()*9)+1);
					combi[3] = Math.floor((Math.random()*9)+1);
				}
				while (VerifErreur(combi)==true);
				essais=7;
				//alert("Combinaison : ".concat(combi[0].toString(),combi[1].toString(),combi[2].toString(),combi[3].toString())); //Debug ( afficher le score à deviner )
			}
			
			function Raz(){
			/*
			Initialiser les prémices d'une nouvelle partie : Champs texte et variables globables
			Entrées: Variables globales et inputs type texte
			Sorties: Assignation des variables et de ces champs
			*/
				
			var i,j;
				fin=false;
				document.getElementById("bulls").setAttribute("value","");
				document.getElementById("cows").setAttribute("value","");
				document.getElementById("reponse").setAttribute("value","");
				for(i = 0 ; i < nb_essais ; i++){
					for(j = 0 ; j < nb_combi ; j++){
						document.getElementsByClassName("combi".concat(i+1).toString())[j].value="";
					}
				}
			}
			
			function Stock()
			{
				
			/*
			Stocker une combinaison vérifiée de chiffres dans la variable "entree" et appel de la fonction Tester
			Entrées: Variables globables entree et combi, essais
			Sorties: Assignation de entree et essais, + appels fonctions Old_Combi et Tester
			*/
				var	i,test;
				
				test=false;
				if (fin==false){
					for (i = 0 ; i < nb_combi ; i++)
					{
						if ((document.getElementsByClassName("combi")[i].value == "") || (essais==0)){
							test=true;	
						}
						else
						{
						entree[i]=document.getElementsByClassName("combi")[i].value;}
					}
					if ((test==false)&& (VerifErreur(entree)==false)){
							essais=essais-1;
							Old_Combi();
							Tester();
							
					}
				}
			}
			
			function Old_Combi(){
			/*
			Stocker visuellement les combinaisons précédemment entrées par l'utilisateur en fonction du nombre d'essais
			Entrées: Variable globale essais et inputs type texte
			Sorties: Assignation inputs correspondant 
			*/
				var i;
				
				for(i=0;i<nb_combi;i++)
				{
				document.getElementsByClassName("combi".concat(nb_essais-essais).toString())[i].value=entree[i].toString();
				}				
			}
			
			function Tester(){
			/*
			Tester le nombre de cows et de bulls dans une combinaison, et assignation des champs correspondants. + Vérification de la victoire ou de la défaite 
			Entrées: Variables globales cows, bulls, score s'incrémentent en conséquence. fin, si une des deux conditions est vérifiée ( score à 0 ou combinaison découverte)
			Sorties: Incrémentation des variables, Assignation variable fin,+ Assignation des objets en conséquence
			*/
				var i,j;
				
					cows=0;
					bulls=0;
					for (i=0 ; i<nb_combi ; i++){
						if (combi[i]==entree[i]){
						cows=cows+1;	
						}
						else{
							for (j=0 ; j<nb_combi ; j++){
								if (entree[i]==combi[j]){
									bulls=bulls+1;
								}
							}
						}
					}
					document.getElementById("bulls").setAttribute("value",bulls);
					document.getElementById("cows").setAttribute("value",cows);
					document.getElementById("reponse").setAttribute("value","Nombre d'essais restant : ".concat(essais.toString()));
					if (essais==0) {
						fin=true;
						if (cows==nb_combi){
							score=score+1;
							document.getElementById("reponse").setAttribute("value","Victoire, score: ".concat(score.toString()));
						}
						else{
							document.getElementById("reponse").setAttribute("value","Défaite, combi: ".concat(combi[0].toString(),combi[1].toString(),combi[2].toString(),combi[3].toString(),". Score : ",score.toString()));
						}
					}
					else{
						if (cows==nb_combi){
							fin=true;
							score=score+1;
							document.getElementById("reponse").setAttribute("value","Victoire, score: ".concat(score.toString()));
						}
					}	
			}