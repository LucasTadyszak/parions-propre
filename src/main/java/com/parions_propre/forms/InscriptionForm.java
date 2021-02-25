package com.parions_propre.forms;

import com.parions_propre.beans.Client;
import com.parions_propre.dao.ClientDao;
import com.parions_propre.dao.DAOException;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.jasypt.util.password.ConfigurablePasswordEncryptor;


public class InscriptionForm {
    private static final String CHAMP_EMAIL        = "email";
    private static final String CHAMP_PSEUDO       = "pseudo";
    private static final String CHAMP_NOM          = "nom";
    private static final String CHAMP_PRENOM       = "prenom";
    private static final String CHAMP_PASS         = "mdp";
    private static final String CHAMP_NAISSANCE    = "naissance";
    private static final String CHAMP_NEWLETTER    = "newletter";
    private static final String CHAMP_CATEGORIE    = "categorie";

    private Date naissance_date;
    private Integer telephone_int;

    private static final String ALGO_CHIFFREMENT = "SHA-256";

    private String resultat;
    private Map<String, String> erreurs = new HashMap<String, String>();

    private ClientDao clientDao;

    public InscriptionForm(ClientDao clientDao) {
        this.clientDao = clientDao;
    }

    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public Client inscrireClient(HttpServletRequest request ) {
        String email = getValeurChamp( request, CHAMP_EMAIL );
        String pseudo = getValeurChamp( request, CHAMP_PSEUDO );
        String nom = getValeurChamp( request, CHAMP_NOM );
        String prenom = getValeurChamp( request, CHAMP_PRENOM );
        String motDePasse = getValeurChamp( request, CHAMP_PASS );
        String naissance = getValeurChamp( request, CHAMP_NAISSANCE );
        String newletter = getValeurChamp( request, CHAMP_NEWLETTER );

        Client client = new Client();

        try {
            traiterEmail( email, client );
            traiterMotsDePasse( motDePasse, client );
            traiterPseudo( pseudo, client );
            traiterNaissance( naissance, client );

            client.setNom(nom);
            client.setPrenom(prenom);
            client.setNewletter(newletter);

            if ( erreurs.isEmpty() ) {
                clientDao.creer( client );
                resultat = "Succès de l'inscription.";
            } else {
                resultat = "Échec de l'inscription.";
            }
        } catch ( DAOException e ) {
            resultat = "Échec de l'inscription : une erreur imprévue est survenue, merci de réessayer dans quelques instants.";
            e.printStackTrace();
        }

        return client;

    }

    /*
     * Appel à la validation de l'adresse email reçue et initialisation de la
     * propriété email du bean
     */
    private void traiterEmail( String email, Client client ) {
        try {
            validationEmail( email );
        } catch (FormValidationException e ) {
            setErreur( CHAMP_EMAIL, e.getMessage() );
        }
        client.setEmail( email );
    }

    /*
     * Appel à la validation des mots de passe reçus, chiffrement du mot de
     * passe et initialisation de la propriété motDePasse du bean
     */
    private void traiterMotsDePasse( String motDePasse, Client client ) {
        try {
            validationMotsDePasse( motDePasse );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_PASS, e.getMessage() );
        }

        /*
         * Utilisation de la bibliothèque Jasypt pour chiffrer le mot de passe
         * efficacement.
         *
         * L'algorithme SHA-256 est ici utilisé, avec par défaut un salage
         * aléatoire et un grand nombre d'itérations de la fonction de hashage.
         *
         * La String retournée est de longueur 56 et contient le hash en Base64.
         */
        ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
        passwordEncryptor.setAlgorithm( ALGO_CHIFFREMENT );
        passwordEncryptor.setPlainDigest( false );
        String motDePasseChiffre = passwordEncryptor.encryptPassword( motDePasse );

        client.setMotDePasse( motDePasseChiffre );
    }

    /*
     * Appel à la validation du pseudo reçue et initialisation de la
     * propriété pseudo du bean
     */
    private void traiterPseudo( String pseudo, Client client ) {
        try {
            validationPseudo( pseudo );
        } catch (FormValidationException e ) {
            setErreur( CHAMP_EMAIL, e.getMessage() );
        }
        client.setPseudo( pseudo );
    }

    /*
     * Appel à la validation de la date de naissance reçue et initialisation de la
     * propriété naissance du bean
     */
    private void traiterNaissance( String naissance, Client client ) {
        Date dateNaissance = null;
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        try {
            validationNaissance( naissance );
            dateNaissance = formatter.parse(naissance);
        } catch (FormValidationException | ParseException e ) {
            setErreur( CHAMP_EMAIL, e.getMessage() );
        }
        client.setNaissance((java.sql.Date) dateNaissance);
    }


    private void validationEmail( String email ) throws FormValidationException {
        if ( email != null ) {
            if ( !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
                throw new FormValidationException( "Merci de saisir une adresse mail valide." );
            } else if ( clientDao.trouver( email ) != null ) {
                throw new FormValidationException( "Cette adresse email est déjà utilisée, merci d'en choisir une autre." );
            }
        } else {
            throw new FormValidationException( "Merci de saisir une adresse mail." );
        }
    }

    private void validationMotsDePasse( String motDePasse ) throws FormValidationException {
        if ( motDePasse != null ) {
            if ( motDePasse.length() < 8 ) {
                throw new FormValidationException( "Les mots de passe doivent contenir au moins 8 caractères." );
            }
        } else {
            throw new FormValidationException( "Merci de saisir votre mot de passe." );
        }
    }

    private void validationPseudo( String pseudo ) throws FormValidationException {
        if ( pseudo != null && pseudo.length() < 3 ) {
            throw new FormValidationException( "Le pseudo doit contenir au moins 3 caractères." );
        }
    }

    private void validationNaissance( String naissance ) throws FormValidationException, ParseException {
        GregorianCalendar calStr1 = new GregorianCalendar(); // Création d'un nouveau calendrier
        calStr1.setTime(new Date()); // Initialisation du calendrier avec la date du jour
        calStr1.add(GregorianCalendar.YEAR, -18);
        String formatDate = "dd/MM/yyyy"; // Création du format pour afficher l'année sur 4 chiffres
        SimpleDateFormat sdf = new SimpleDateFormat(formatDate); // Initialisation du format de l'année sur 4 chiffres
        Date dateNaissance = null;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
        dateNaissance = (Date) simpleDateFormat.parse(naissance);
        if (dateNaissance.after(calStr1.getTime())){
            throw new FormValidationException( "Vous devez être majeur." );
        }
    }


    /*
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     */
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }

    /*
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * sinon.
     */
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }
    }
}
