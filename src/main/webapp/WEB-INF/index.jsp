<%@ include file="templates/header.jsp" %>
<%@ include file="templates/menu.jsp" %>

<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <h1 class="display-4 section-title">L'appli indispensable pour les parieurs</h1>
    <p class="lead px-3">Avec Parions Propre, préparez vos paris sportifs sur plusieurs compétitions
        de sports différents. Chaque jours, les statistiques sont actualisées pour vous offrir une
        meilleurs expériences. Nos statistiques se base sur un puissant algorithme qui calcule un
        pourcentage en fonction de différents facteurs.</p>
</div>

<div class="container">
    <div class="card-deck mb-3 text-center">
        <div id="" class="card mb-4 shadow-sm">
            <div class="card-header">
                <h4 class="my-0 font-weight-normal">Site Web</h4>
            </div>
            <div class="card-body">
                <img class="img-web" src="/public/images/web.png" alt="site internet">
                <ul class="list-unstyled mt-3 mb-5">
                    <li class="label-title"><span class="number-title">129</span> pays</li>
                    <li class="label-title"><span class="number-title">223</span> championnats</li>
                    <li class="label-title"><span class="number-title">575 340</span> équipes</li>
                </ul>
                <button type="button" class="btn btn-lg btn-block btn-outline-success disabled">Bienvenue</button>
            </div>
        </div>
        <div id="android" class="card mb-4 shadow-sm">
            <div class="card-header">
                <h4 class="my-0 font-weight-normal">Android</h4>
            </div>
            <div class="card-body">
                <img class="img-android" src="/public/images/android.png" alt="site internet">
                <ul class="list-unstyled mt-3 mb-4">
                    <li>20 users included</li>
                    <li>10 GB of storage</li>
                    <li>Priority email support</li>
                    <li>Help center access</li>
                </ul>
                <button type="button" class="btn btn-lg btn-block btn-success">Télécharger</button>
            </div>
        </div>
        <div id="apple" class="card mb-4 shadow-sm">
            <div class="card-header">
                <h4 class="my-0 font-weight-normal">Apple</h4>
            </div>
            <div class="card-body">
                <img class="img-apple" src="/public/images/apple.png" alt="site internet">
                <ul class="list-unstyled mt-3 mb-4">
                    <li>30 users included</li>
                    <li>15 GB of storage</li>
                    <li>Phone and email support</li>
                    <li>Help center access</li>
                </ul>
                <button type="button" class="btn btn-lg btn-block btn-success">Télécharger</button>
            </div>
        </div>
    </div>
</div>

<%@ include file="templates/footer.jsp" %>