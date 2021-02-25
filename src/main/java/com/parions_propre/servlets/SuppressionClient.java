package com.parions_propre.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.parions_propre.beans.Client;
import com.parions_propre.dao.ClientDao;
import com.parions_propre.dao.DAOException;
import com.parions_propre.dao.DAOFactory;

public class SuppressionClient extends HttpServlet {
    public static final String CONF_DAO_FACTORY     = "daofactory";
    public static final String PARAM_EMAIL_CLIENT   = "emailClient";
    public static final String SESSION_CLIENTS      = "clients";

    public static final String VUE                  = "/index";

    private ClientDao          clientDao;

    public void init() throws ServletException {
        /* Récupération d'une instance de notre DAO Utilisateur */
        this.clientDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getClientDao();
    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        /* Récupération du paramètre */
        String emailClient = getValeurParametre( request, PARAM_EMAIL_CLIENT );

        /* Récupération de la Map des clients enregistrés en session */
        HttpSession session = request.getSession();
        Map<String, Client> clients = (HashMap<String, Client>) session.getAttribute( SESSION_CLIENTS );

        /* Si l'email du client et la Map des clients ne sont pas vides */
        if ( emailClient != null && clients != null ) {
            try {
                /* Alors suppression du client de la BDD */
                clientDao.supprimer( clients.get( emailClient ) );
                /* Puis suppression du client de la Map */
                clients.remove( emailClient );
            } catch ( DAOException e ) {
                e.printStackTrace();
            }
            /* Et remplacement de l'ancienne Map en session par la nouvelle */
            session.setAttribute( SESSION_CLIENTS, clients );
        }

        /* Redirection vers la fiche récapitulative */
        response.sendRedirect( request.getContextPath() + VUE );
    }

    /*
     * Méthode utilitaire qui retourne null si un paramètre est vide, et son
     * contenu sinon.
     */
    private static String getValeurParametre( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }
}