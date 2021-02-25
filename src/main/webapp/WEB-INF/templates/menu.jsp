<!-- Preloader -->
<div class="spinner-wrapper">
    <div class="spinner">
        <div class="bounce1"></div>
        <div class="bounce2"></div>
        <div class="bounce3"></div>
    </div>
</div>
<!-- end of preloader -->


<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
    <div class="container">

        <!-- Text Logo - Use this if you don't have a graphic logo -->
        <!-- <a class="navbar-brand logo-text page-scroll" href="index.html">Tivo</a> -->

        <!-- Image Logo -->
        <a class="navbar-brand logo-image" href="#"><img src="/parions_propre/public/images/parions_propre-Logo_sans_couronne.png" alt="alternative"></a>
        <p class="pt-2 pr-3" style="color:#fff;"><?php echo "Bienvenue, ".$_SESSION['pseudo']; ?></p>
        <!-- Mobile Menu Toggle Button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-awesome fas fa-bars"></span>
            <span class="navbar-toggler-awesome fas fa-times"></span>
        </button>
        <!-- end of mobile menu toggle button -->

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="index.php?action=index"><i class="fas fa-user-circle fa-fw"></i> <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="index.php?action=stat"><i class="fas fa-chart-line"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="index.php?action=settings"><i class="fas fa-cogs"></i></a>
                </li>
            </ul>
            <span class="nav-item">
                    <a class="btn-outline-sm" href="view/disconnectView.php">Déconnexion</a>
                </span>
        </div>
    </div> <!-- end of container -->
</nav> <!-- end of navbar -->
<!-- end of navigation -->