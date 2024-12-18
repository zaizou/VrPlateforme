<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card section-create" style="display:none">
    <!--L'entete de la page' -->

    <div class="card-header">
        <div class="row">
            <div class="col-sm-9">
                <h2>Fiche Structure
                    <small>Affichage des informations sur la Structure</small>
                </h2>

                <div class=""></div>
                <button class="btn btn-login compte-create-submit">Créer la Structure
                </button>
                <button class="btn btn-login btn-danger compte-create_cancel">Annuler</button>


            </div>
            <div class="col-sm-3" dir="rtl">
                <a href="#"
                   class="btn btn-login btn-danger btn-float waves-effect waves-circle waves-float section-return-btn"><i
                        class="zmdi zmdi-arrow-left"></i></a>
            </div>

        </div>
    </div>


    <div class="card-contenu compte-detail">
        <div class="panel-group p-l-20" role="tablist" aria-multiselectable="true">
            <div class="panel panel-collapse">
                <div class="panel-heading active" role="tab" id="headingOne1">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne1"
                           aria-expanded="true" aria-controls="collapseOne1" class="">
                            Informations sur la Structure
                        </a>
                    </h4>
                </div>
                <div id="collapseOne1" class="collapse in" role="tabpanel" aria-labelledby="headingOne1"
                     aria-expanded="true">
                    <div class="panel-body">
                        <div id="section_creation_form" class="row">
                            <div class="col-sm-4">
                                <div class="fg-line">
                                    <input id="creat_input_code_struct" placeholder="Code Structure " class="form-control compte">
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="fg-line">
                                    <input id="creat_input_nom_struct" placeholder="Nom" class="form-control compte">
                                </div>
                            </div>

                            <div class="col-sm-8">
                                <br/>
                                <div class="fg-line">
                                    <input id="creat_input_address_struct" placeholder="Addresse" class="form-control compte">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>