<%--
  Created by IntelliJ IDEA.
  User: lucastadyszak
  Date: 19/02/2021
  Time: 09:54
--%>
<%@ include file="templates/headerHTML.jsp" %>

<form method="post" action="inscription">
    <fieldset>
        <legend>Inscription</legend>
        <p>Vous pouvez vous inscrire via ce formulaire.</p>

        <label for="nom">Nom <span class="requis">*</span></label>
        <input type="nom" id="nom" name="nom" value="<c:out value="${param.nom}"/>" size="20" maxlength="60" />
        <span class="erreur">${erreurs['nom']}</span>
        <br />

        <label for="prenom">Prénom <span class="requis">*</span></label>
        <input type="prenom" id="prenom" name="prenom" value="<c:out value="${param.prenom}"/>" size="20" maxlength="60" />
        <span class="erreur">${erreurs['emprenomil']}</span>
        <br />

        <label for="pseudo">Pseudo <span class="requis">*</span></label>
        <input type="text" id="pseudo" name="pseudo" value="<c:out value="${param.pseudo}"/>" size="20" maxlength="60" />
        <span class="erreur">${erreurs['pseudo']}</span>
        <br />

        <label for="email">Adresse email <span class="requis">*</span></label>
        <input type="email" id="email" name="email" value="<c:out value="${param.email}"/>" size="20" maxlength="60" />
        <span class="erreur">${erreurs['email']}</span>
        <br />

        <label for="naissance">Date de naissance : (yyyy-mm-dd)</label>
        <input type="text" id="naissance" class="form-control" name="naissance" placeholder="YYYY-MM-DD" size="10" maxlength="10" required>
        <span class="erreur">${form.erreurs['naissance']}</span>
        <br />

        <label for="motdepasse">Mot de passe <span class="requis">*</span></label>
        <input type="password" id="motdepasse" name="motdepasse" value="" size="20" maxlength="20" />
        <span class="erreur">${erreurs['motdepasse']}</span>
        <br />

        <label for="confirmation">Confirmation du mot de passe <span class="requis">*</span></label>
        <input type="password" id="confirmation" name="confirmation" value="" size="20" maxlength="20" />
        <span class="erreur">${erreurs['confirmation']}</span>
        <br />

        <label for="newletter">
        <input type="checkbox" id="newletter" class="" name="newletter" checked value="True">  Souhaitez-vous recevoir tous les bons plans par mail ?</label>
        <br />

        <input type="submit" value="Inscription" class="sansLabel" />
        <br />

        <p class="${empty erreurs ? 'succes' : 'erreur'}">${resultat}</p>
    </fieldset>
</form>
<%@ include file="templates/footerHTML.jsp" %>
<%--
<div class="modal fade text-center py-5" style="top:30px" id="signinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <img src="https://sunlimetech.com/portfolio/sunlimeuikit/imgs/s.png" class="modal-img">
                <h3 class="pt-3 pb-3 mb-0 text-secondary">Inscris toi pour ne rien louper!</h3>
                <form class="" method="post" action="index.php">
                    <label for="pseudo">Pseudo :</label>
                    <input type="text" id="pseudo" class="form-control" name="pseudo" placeholder="BetKing" aria-label="pseudo" value="<c:out value="${client.pseudo}"/>" required>
                    <span class="erreur">${form.erreurs['pseudo']}</span>

                    <label for="nom">Nom de famille :</label>
                    <input type="text" id="nom" class="form-control" name="nom" placeholder="Parions" aria-label="nom" value="<c:out value="${client.nom}"/>" required>

                    <label for="prenom">Prénom :</label>
                    <input type="text" id="prenom" class="form-control" name="prenom" placeholder="Propre" aria-label="prenom" value="<c:out value="${client.prenom}"/>" required>

                    <label for="genre">Sexe</label>
                    <select id="genre" class="form-control" name="genre" required>
                        <option>Femme</option>
                        <option>Homme</option>
                    </select>

                    <label for="naissance">Date de naissance : (yyyy-mm-dd)</label>
                    <input type="text" id="naissance" class="form-control" name="naissance" placeholder="YYYY-MM-DD" size="10" maxlength="10" required>
                    <span class="erreur">${form.erreurs['naissance']}</span>

                    <label for="email">Adresse mail :</label>
                    <input type="email" id="email" class="form-control" name="email" placeholder="support@parionspropre.com" aria-label="email" value="<c:out value="${param.email}"/>" required>
                    <span class="erreur">${form.erreurs['eamil']}</span>

                    <label for="motDePasse">Mot de passe :</label>
                    <input type="password" id="motDePasse" class="form-control" name="mdp" placeholder="&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;" aria-label="mot de passe" min="8" required>
                    <span class="erreur">${form.erreurs['motDePasse']}</span>

                    <label for="telephone">Numéro de téléphone (facultatif) :</label>
                    <input type="text" id="telephone" class="form-control" name="telephone" placeholder="0600000000" aria-label="telephone" maxlength="10" >
                    <span class="erreur">${form.erreurs['telephone']}</span>

                    <label for="newletter">
                        <input type="checkbox" id="newletter" class="" name="newletter" checked value="True">  Souhaitez-vous recevoir tous les bons plans par mail ?</label>

                    <br><br>

                    <button class="btn btn-success mt-3" type="submit" name="inscription" value="Inscription">
                        S'inscrire &#10003;
                    </button>
                    <p class="${empty erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
                </form>
            </div>
        </div>
    </div>
</div>
--%>
