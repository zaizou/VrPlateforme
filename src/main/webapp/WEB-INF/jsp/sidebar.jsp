<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <aside id="sidebar" class="sidebar c-overflow mCustomScrollbar _mCS_1 mCS-autoHide" style="overflow: visible;">
        <div id="mCSB_1" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical_horizontal mCSB_outside" tabindex="0">
            <div id="mCSB_1_container" class="mCSB_container mCS_x_hidden mCS_no_scrollbar_x"
                 style="position: relative; top: 0px; left: 0px; width: 100%;" dir="ltr">
                <div class="profile-menu">
                    <a href="#">
                        <div class="profile-pic">
                            
                        </div>

                        
                    </a>

                    
                </div>



                <ul class="main-menu">
                    <li ><a href="index.jsp"><i class="zmdi zmdi-home"></i> Acceuil</a></li>


                    <sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">

                    <li class="sub-menu">
                        <a href="#"><i class="zmdi zmdi-home"></i> Gestion des Utilisateurs</a>
                        <ul>
                            <li><a href="gestion_utilisateurs_utilisateurs.html"><i class="zmdi zmdi-face zmdi-hc-fw "></i> Utilisateurs</a></li>
                            <li><a href="gestion_utilisateurs_fonctionnalites.html"><i class="zmdi zmdi-lamp zmdi-hc-fw"></i> Fonctionnalites</a></li>
                        </ul>
                    </li>

                    </sec:authorize>

                    <li class="sub-menu">
                        <a href="#"><i class="zmdi zmdi-view-compact"></i> Nomenclatures</a>
                        <ul>
                            <li><a href="nomenclatures_strcutures.html"><i class="zmdi  zmdi-city "></i> Structures</a></li>
                            <li><a href="nomenclatures_sections.html"><i class="zmdi zmdi-view-carousel zmdi-hc-fw"></i> Sections</a></li>
                            <li><a href="nomenclatures_chapitres.html"><i class="zmdi zmdi-view-day zmdi-hc-fw"></i> Chapitres</a></li>
                            <li><a href="nomenclatures_rubriques.html"><i class="zmdi zmdi-view-list-alt zmdi-hc-fw"></i> Rubriques</a></li>
                            <li><a href="nomenclatures_comptables.html"><i class="zmdi zmdi-balance zmdi-hc-fw"></i> Nomenclatures Comptables</a></li>
                            <li><a href="nomenclatures_budgetaires.html"><i class="zmdi zmdi-labels zmdi-hc-fw"></i> Comptes </a></li>
                        </ul>
                    </li>

                    <li class="sub-menu">
                        <a href="#"><i class="zmdi zmdi-view-compact"></i> Dotation</a>
                        <ul>
                            <li><a href="index0.html"><i class="zmdi  zmdi-city "></i> Ajouter Dotation Intiale </a></li>
                            <li><a href="index11.html"><i class="zmdi zmdi-view-carousel zmdi-hc-fw"></i> Ajouter Dotation Supplementaire</a></li>
                            <li><a href="AfficherDecisionIntiale.html"><i class="zmdi zmdi-view-day zmdi-hc-fw"></i>Afficher liste Dotation Intiale</a></li>
                            <li><a href="AfficherDecisionSupp.html"><i class="zmdi zmdi-view-list-alt zmdi-hc-fw"></i>Afficher liste Dotation Supplementaire </a></li>
                        </ul>
                    </li>

                    <li class="sub-menu">
                        <a href="#"><i class="zmdi zmdi-mail-send zmdi-hc-fw"></i> Transfert</a>
                        <ul>
                            <li class="sub-menu" >
                                <a ><i class="zmdi zmdi-city-alt zmdi-hc-fw"></i> Demande Transfert Interne</a>
                                <ul>
                                    <li ><a href="addDemandeTransfert.html"><i class="zmdi zmdi-truck zmdi-hc-fw"></i> Un seul Compte</a></li>
                                    <li ><a href="addDemandePlusieursCompte.html"><i class="zmdi zmdi-truck zmdi-hc-fw"></i> Plusieurs Comptes</a></li>
                                </ul>
                            </li>


                            <li ><a href="addDemandeTransfertExterne.html"><i class="zmdi zmdi-truck zmdi-hc-fw"></i> Demande Transfert Externe</a></li>
                            <sec:authorize access="hasAnyAuthority('ROLE_VOIR_DISPONIBIITE_INTRA', 'ROLE_ADMIN')">
                                <li ><a href="AllDemandes.html"><i class="zmdi zmdi-city-alt zmdi-hc-fw"></i> Liste des demandes de transfert Interne</a></li>
                            </sec:authorize>
                            <sec:authorize access="hasAnyAuthority('ROLE_VOIR_DISPONIBIITE_INTER', 'ROLE_ADMIN')">
                                <li ><a href="AllDemandesExterne.html"><i class="zmdi zmdi-city-alt zmdi-hc-fw"></i> Liste des demandes de transfert externe</a></li>
                            </sec:authorize>
                        </ul>
                    </li>

                    <li class="sub-menu">
                        <a href="#"><i class="zmdi zmdi-view-compact"></i> Engagement</a>
                        <ul>
                            <li ><a href="eng.html"><i class="zmdi zmdi-city-alt zmdi-hc-fw"></i>Ajouter Engagement</a></li>
                            <li ><a href="FicheFournisseur.html"><i class="zmdi zmdi-city-alt zmdi-hc-fw"></i>Ajouter Fournissuer</a></li>
                        </ul>
                    </li>
               
                
                 <li class="sub-menu">
                        <a href="#"><i class="zmdi zmdi-view-compact"></i> Guides</a>
                        <ul>
	                        <sec:authorize access="hasAuthority('ROLE_USER')">
	                            <li ><a href="AllGuides.html"><i class="zmdi zmdi-city-alt zmdi-hc-fw"></i>Liste des guides</a></li>
	                        </sec:authorize> 
                            <sec:authorize access="hasAnyAuthority('ROLE_USER')">
                            	<li ><a href="NewGuide.html"><i class="zmdi zmdi-truck zmdi-hc-fw"></i>Ajouter un guide</a></li>
                        	</sec:authorize>

                  
                        </ul>
                   </li>



                    <sec:authorize access="hasAnyAuthority('ROLE_USER', 'ROLE_CREER_OPERATION_BUDGETAIRE', 'ROLE_CREER_OPERATION_COMPTABLE', 'ROLE_VALIDER_ECRITURE', 'ROLE_ANNULER_ECRITURE', 'ROLE_ADMIN')">
                        <li class="sub-menu">
                            <a href="#"><i class="zmdi zmdi-view-compact"></i> Opérations</a>
                            <ul>
                                <sec:authorize access="hasAnyAuthority('ROLE_CREER_OPERATION_BUDGETAIRE', 'ROLE_ADMIN')">
                                    <li ><a href="opbudg.html"><i class="zmdi zmdi-city-alt zmdi-hc-fw"></i>Ajouter Opération Budgétaire</a></li>
                                </sec:authorize>
                                <sec:authorize access="hasAnyAuthority('ROLE_CREER_OPERATION_COMPTABLE', 'ROLE_ADMIN')">
                                    <li ><a href="opcompt.html"><i class="zmdi zmdi-truck zmdi-hc-fw"></i>Ajouter Opération Comptable</a></li>
                                </sec:authorize>

                                    <li ><a href="operations.html"><i class="zmdi zmdi-truck zmdi-hc-fw"></i>Liste d'opérations</a></li>

                        <sec:authorize access="hasAnyAuthority('ROLE_VALIDER_ECRITURE', 'ROLE_ADMIN')">
                                    <li ><a href="brouillard.html"><i class="zmdi zmdi-truck zmdi-hc-fw"></i>Brouillard</a></li>
                        </sec:authorize>
                                <li ><a href="newpiece.html"><i class="zmdi zmdi-truck zmdi-hc-fw"></i>Ajouter une piece</a></li>

                                    <li ><a href="journal.html"><i class="zmdi zmdi-truck zmdi-hc-fw"></i>Journal</a></li>

                            </ul>
                        </li>
                    </sec:authorize>

                   <li class="sub-menu">
                        <a href="#"><i class="zmdi zmdi-view-compact"></i> Aide</a>
                        <ul>
	                        <sec:authorize access="hasAnyAuthority('ROLE_USER')">
	                            <li ><a href="pdfs/guide_util.pdf"><i class="zmdi zmdi-city-alt zmdi-hc-fw"></i>Guide d'utilisation</a></li>
	                        </sec:authorize> 
                            <sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
                            	<li ><a href="pdfs/guide_admin.pdf"><i class="zmdi zmdi-truck zmdi-hc-fw"></i>Guide d'administration</a></li>
                        	</sec:authorize>


                        </ul>
                   </li>
                   
                   <li><a href="logout"><i class="zmdi zmdi-time-restore"></i> Deconnexion</a></li>

                </ul>







            </div>
        </div>


        <div id="mCSB_1_scrollbar_vertical"
             class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
             style="display: block;">
            <div class="mCSB_draggerContainer">
                <div id="mCSB_1_dragger_vertical" class="mCSB_dragger"
                     style="position: absolute; min-height: 50px; display: block; height: 403px; max-height: 568px;"
                     oncontextmenu="return false;">
                    <div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
                </div>
                <div class="mCSB_draggerRail"></div>
            </div>
        </div>

        <div id="mCSB_1_scrollbar_horizontal"
             class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal-dark mCSB_scrollTools_horizontal"
             style="display: none;">
            <div class="mCSB_draggerContainer">
                <div id="mCSB_1_dragger_horizontal" class="mCSB_dragger"
                     style="position: absolute; min-width: 50px; width: 0px; left: 0px;" oncontextmenu="return false;">
                    <div class="mCSB_dragger_bar"></div>
                </div>
                <div class="mCSB_draggerRail"></div>
            </div>
        </div>
    </aside>
