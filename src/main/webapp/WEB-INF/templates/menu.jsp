<nav class="navbar navbar-expand navbar-dark bg-success static-top">
    <a class="navbar-brand " href="index">Parions Propre</a>
    <!-- Navbar Search -->
    <form class=" d-md-inline-block form-inline ml-auto mr-0 my-2 " method="post" action="index.php">
        <div class="input-group">
            <div class="input-group-append">
                <input type="text" class="form-control" name="email" placeholder="Email" aria-label="Email">
                <input type="password" class="form-control" name="mdp" placeholder="Mot de passe" aria-label="Mot de passe">
                <button id="connected" class="btn btn-success" type="submit" name="connexion">
                    <i class="fa fa-money-bill" aria-hidden="true"></i>
                </button>
            </div>
        </div>
    </form>
    <div class="input-group-append ml-3">
        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#signinModal">
            Inscription
        </button>
    </div>
</nav>

<div class="modal fade text-center py-5" style="top:30px" id="signinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <img src="https://sunlimetech.com/portfolio/sunlimeuikit/imgs/s.png" class="modal-img">
                <h3 class="pt-3 pb-3 mb-0 text-secondary">Inscris toi pour ne rien louper!</h3>
                <form class="" method="post" action="index.php">
                    <label for="pseudo">Pseudo :</label>
                    <input type="text" id="pseudo" class="form-control" name="pseudo" placeholder="BetKing" aria-label="pseudo" required>
                    <label for="nom">Nom de famille :</label>
                    <input type="text" id="nom" class="form-control" name="nom" placeholder="Parions" aria-label="nom" required>
                    <label for="prenom">Prénom :</label>
                    <input type="text" id="prenom" class="form-control" name="prenom" placeholder="Propre" aria-label="prenom" required>
                    <label for="genre">Sexe</label>
                    <select id="genre" class="form-control" name="genre">
                        <option>Femme</option>
                        <option>Homme</option>
                    </select>
                    <label for="naissance">Date de naissance : (yyyy-mm-dd)</label>
                    <input type="text" id="naissance" class="form-control" name="naissance" placeholder="YYYY-MM-DD" size="10" maxlength="10" required>

                    <label for="email">Adresse mail :</label>
                    <input type="email" id="email" class="form-control" name="email" placeholder="support@parionspropre.com" aria-label="email" required>
                    <label for="motDePasse">Mot de passe :</label>
                    <input type="password" id="motDePasse" class="form-control" name="mdp" placeholder="&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;" aria-label="mot de passe" min="8" required>
                    <label for="telephone">Numéro de téléphone (facultatif) :</label>
                    <input type="text" id="telephone" class="form-control" name="telephone" placeholder="0600000000" aria-label="telephone" maxlength="10" >
                    <label for="newletter"><input type="checkbox" id="newletter" class="" name="newletter" checked value="True">  Souhaitez-vous recevoir tous les bons plans par mail ?</label>
                    <br><br>
                    <button class="btn btn-success mt-3" type="submit" name="inscription">
                        S'inscrire &#10003;
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>