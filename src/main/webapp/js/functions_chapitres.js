/*Projet Comptable et Budgétaire functions*/
var compteEditMode = false;
var compteSelected = false;
var selectedCompte = -1;
var compteCreationMode = false;
var compteShowingMode = false;


var data_section = {
    code_section: 1,
    designation: "exploitation"
};


//Initialisation du tableau contenant les sections
$(document).ready(function () {

    //Initialisation
    $.getJSON('nomenclatures_sections_list.json', {
        ajax: 'true'
    }, function (result) {
        var htln = "";
        for (var i = 0; i < result.sectionList.length; i++) {
            console.log("Section " + i);
            console.log("Code Section " + result.sectionList[i].codeSection);
            console.log("Designation" + result.sectionList[i].designation);
            htln += '<option value=';
            htln += "" + result.sectionList[i].codeSection;
            htln += '>';
            htln += "" + result.sectionList[i].designation;
            htln += '</option>';
        }
        //alert(htln);
        $("#chapitre-select-section")
            .html(htln)
         .selectpicker('refresh');

        //$("#chapitre-select-section").append(htln);
//            append(htln);
    }).done(function () {
        console.log("apres success");
    })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete toujours succes ou erreur");
        });


    //databinding
    $("#data-table-command").bootgrid({
        css: {
            icon: 'zmdi icon',
            iconColumns: 'zmdi-view-module',
            iconDown: 'zmdi-expand-more',
            iconRefresh: 'zmdi-refresh',
            iconUp: 'zmdi-expand-less'
        },
        formatters: {
            "commands": function (column, row) {
                return "<button type=\"button\" class=\"showingInfos btn btn-icon command-edit waves-effect waves-circle\" data-row-id=\"" + row.id + "\"><span class=\"zmdi zmdi-assignment\"></span></button> " +
                    "<button type=\"button\" class=\"compte-suppr extern btn btn-icon command-delete waves-effect waves-circle\" data-row-id=\"" + row.id + "\"><span class=\"zmdi zmdi-delete\"></span></button> ";
                ;
            }
        }

    });
}).on("loaded.rs.jquery.bootgrid", function () {

    $("#data-table-command").find('button.compte-suppr.extern').on("click", function (e) {
        var rows = Array();
        rows[0] = $(this).data("row-id");
        var idUtilisateur = $($(this).closest('tr')).find('td').eq(1).text();
        afficherSupprChapitre(idUtilisateur, rows);

    })
        .end().find("button.showingInfos").on("click", function (e) {
        var rows = Array();
        rows[0] = $(this).data("row-id");
        var idUtilisateur = $($(this).closest('tr')).find('td').eq(1).text();
        window.location.replace("nommenclatures_get_chapitre.html?code_chapitre="+idUtilisateur);
        //alert("you pressed edit on row " + $(this).data("row-id"));
    });



    //Click le bouton creer une section
    $('button.section-create').on('click', function () {
        compteCreationMode = true;
        compteEditMode = false;
        compteShowingMode = false;
        afficherSection();
    });


//Click le bouton affichage d'une section
    $('button.showingInfos').on('click', function () {
        selectedCompte = $(this.closest('tr')).attr('data-row-id');
        compteShowingMode = true;
        compteCreationMode = false;
        compteEditMode = false;
        afficherSection();
    });


    //Click sur le bouton modifier (interne)
    $('button.compte-mod').on('click', function () {
        compteEditMode = true;
        compteShowingMode = false;
        compteCreationMode = false;
        afficherSection();
    });


    $('button.compte-create-submit').on('click', function () {
        afficherCreateChapitreMessage();
    });


    $('button.compte-mod-save').on('click', function () {
        afficherModifAccountMessage();
    });


//Click sur le bouton  supprimer un chapitre
    $('button.chpitre-suppr').on('click', function () {

    });

    //Click sur le bouton  créer un chapitre
    $('button.rubrique-create-submit').on('click', function () {
        afficherCreateChapitreMessage();

    });


    $('button.rubrique-create_cancel').on('click', function () {
        $("input.rubrique").val("");
        $('.card.section-detail').css('display', '');
        $('.card.rubrique-create').css('display', 'none');
    });

    $('a.rubrique-return').on('click', function () {
        //$( "input.chapitre" ).prop( "readonly", true );
        $('.card.section-detail').css('display', '');
        //$('.card.chapitre-create').addClass('animated fadeOuLeft');
        $('.card.rubrique-create').css('display', 'none');
        compteShowingMode = true;
    });


}).on('selected.rs.jquery.bootgrid',function (e,row) {
        alert(e);
});
;


//Configuration du tableau contenant les rubrique
$(document).ready(function () {
    $("#chapitre-data-table-command").bootgrid({
        css: {
            icon: 'zmdi icon',
            iconColumns: 'zmdi-view-module',
            iconDown: 'zmdi-expand-more',
            iconRefresh: 'zmdi-refresh',
            iconUp: 'zmdi-expand-less'
        },
        formatters: {
            "commands": function (column, row) {
                return "<button type=\"button\" class=\"rubrique-suppr extern btn btn-icon command-delete waves-effect waves-circle\" data-row-id=\"" + row.id + "\"><span class=\"zmdi zmdi-delete\"></span></button> ";
            }
        }

    });
}).on("loaded.rs.jquery.bootgrid", function () {


    //Click sur le bouton  supprimer un chapitre
    $('button.rubrique-create').on('click', function () {
        afficherCreateChapitre();


    });


    //Click sur le bouton  supprimer un chapitre
    $('button.rubrique-suppr').on('click', function () {
        /* var rows=Array();
         rows[0] = $(this).data("row-id");
         afficherSupprChapitre(rows);
         alert("You pressed edit on row: " + $(this).data("row-id"));*/

        var rows = Array();
        rows[0] = $(this).data("data-row-id");
        $("#chapitre-data-table-command").bootgrid('remove', rows);


    });


});


function afficherCreateChapitre() {

    //$( "input.compte" ).prop( "readonly", false );
    $('.card.section-detail').css('display', 'none');
    $('.card.rubrique-create').css('display', '');
    $('.card.rubrique-create').addClass('animated fadeInLeft');
    compteShowingMode = false;

}


function afficherSection() {
    //affichage uniquement
    if (compteShowingMode) {
        $("input.compte").prop("readonly", true);
        $('button.compte-mod-save').css('display', 'none');
        $('button.compte-mod').css('display', '');
        $('button.compte-suppr').css('display', '');
        $('.card.section-detail').css('display', '');
    }
    if (compteEditMode) {
        $("input.compte").prop("readonly", false);
        $('button.compte-mod-save').css('display', '');
        $('button.compte-mod').css('display', 'none');
        $('button.compte-suppr.intern').css('display', 'none');
        $('.card.section-detail').css('display', '');
    }
    if (compteCreationMode)
        $('.card.section-create').css('display', '');


    $('.card.list-sections').css('display', 'none');

}


//Click sur le bouton  supprimer
$('button.compte-suppr.intern').on('click', function () {
    afficherSupprMessage(this.closest('tr'));
});

//Click sur le bouton de retour
$('a.btn-login.section-return-btn').on('click', function () {
    if (compteEditMode || compteShowingMode)
        $('.card.section-detail').css('display', 'none');
    if (compteCreationMode)
        $('.card.section-create').css('display', 'none');

    $('.card.list-sections').css('display', '');
});


///Click sur le Bouton annuler de l'interface ceer une nouvelle section
$('button.compte-create_cancel').on('click', function () {
    //alert("code section : "+data_section.code_section+"\ndesignation :"+data_section.designation);
    $("input.compte").val("");
    compteCreationMode = false;
    $('.card.section-create').css('display', 'none');
    $('.card.list-sections').css('display', '');


});

function afficherModifAccountMessage() {
    var codeChap = $('#edit_input_classes ').val();
    var designationChap = $('#edit_input_nom').val();
    swal({
        title: "Etes Vous Sure ?",
        text: "Voulez vous valider la modification du compte ?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: false,
        confirmButtonText: "Valider",
        confirmButtonColor: "#ec6c62"
    }, function () {
        $.ajax(
            {
                type: "POST",
                url: "nomenclatures_chapitre_edit.html",
                data: {code_chapitre: codeChap, designation: designationChap},
                success: function (data) {
                    if (data == 100)
                        swal("Succès!", "Les Modifications sont effectuées avec succès", "success");
                    else
                        swal("Erreur", "Le Compte n'est pas modifié", "error");

                }
            }
        )
            .done(function (data) {
                swal("Succès!", "Les Modifications sont effectuées avec succès", "success");
            })
            .error(function (data) {
                swal("Erreur", "Le Compte n'est pas modifié", "error");
            });
    });
}

function afficherCreateChapitreMessage() {

    var code_chap = $('#creat_input_codechap ').val();
    var designation_chap = $('#creat_input_designation').val();
    var code_sect=$('#chapitre-select-section').val();
    //alert("code chapitre : "+code_chap+"\n"+"designation chapitre :"+designation_chap+"code section :"+code_sect );
    swal({
        title: "Etes Vous Sure ?",
        text: "Voulez vous vraiment Ajouter ce Chapitre ?",
        type: "info",
        showCancelButton: true,
        closeOnConfirm: false,
        confirmButtonText: "Confirmer",
        confirmButtonClass: "btn  btn-success waves-effect",
    }, function () {
        $.ajax(
            {
                type: "POST",
                url: "nomenclatures_chapitre_create.html",
                data: {code_chapitre: code_chap, designation_chapitre: designation_chap,code_section:code_sect},
                success: function (data) {
                    if (JSON.parse(data) == "100")
                            {swal("Succès!", "Le Chapitre est ajoutée avec Succès", "success");

                        window.location.replace("nomenclatures_chapitres.html");

                    }

                    else
                        swal("Erreur", "Le Chapitre n'est pas ajouté", "error");
                }
            }
        )
            .done(function (data) {

                swal("Succès!", "Le Chapitre est ajoutée avec Succès", "success");
            })
            .error(function (data) {
                swal("Erreur", "Le Chapitre n'est pas ajouté", "error");
            });
    });
}

function afficherSupprChapitre(code_sect, selectedRow) {

    console.log("the chapitre code is :" +selectedRow);

    swal({
            title: 'Ete Vous Sure ?',
            text: "Voulez vous vraiment supprimer Ce Chapitre!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            confirmButtonText: 'Oui, Confirmer!',
            cancelButtonText: 'Annuler',
            confirmButtonClass: 'btn btn-danger',
            cancelButtonClass: 'btn',
            buttonsStyling: false,
            closeOnConfirm: true,

        },
        function (isConfirm) {
            if(isConfirm)
                $.ajax(
                    {
                        type: "POST",
                        dataType: 'json',
                        url: "nomenclatures_chapitre_remove.html",
                        data: {code_chapitre: code_sect},

                    }
                ).done(function (data) {
                    if (JSON.parse(data) == "100"){
                        $('#data-table-command').bootgrid("remove", selectedRow);
                        swal("Succès!", "Elément supprimé avec Succès", "success");
                    }

                    else
                        if(JSON.parse(data) == "101")
                            swal("Erreur", "Element n'existe pas", "error");
                        else
                            swal("Erreur", "Suppresion non effectuée", "error");
                })
                    .error(function (data) {
                        swal("Erreur", "Chapitre non  Supprimé", "error");
                    });

        });


}
