<%--
  Created by IntelliJ IDEA.
  User: lucastadyszak
  Date: 19/02/2021
  Time: 09:54
--%>
<nav class="navbar navbar-expand navbar-dark bg-success static-top">
    <a class="navbar-brand " href="index">Parions Propre</a>
    <!-- Navbar Search -->
    <form class=" d-md-inline-block form-inline ml-auto mr-0 my-2 " method="post" action="index">
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

