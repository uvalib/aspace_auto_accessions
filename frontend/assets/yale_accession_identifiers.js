$(function () {

  var $ids = $('div.identifier-fields');
  var $id_0 = $('div.identifier-fields input#accession_id_0_');

  $('#accession_id_2_').val('XXXX');
  $('#accession_id_3_').hide();
  

  var init = function () {
    $ids.removeClass('required');
    $id_0.attr('readonly', 'readonly');

    var date = $('#accession_accession_date_').val();
    if (date.length) update_fiscal_year(date);

    $.ajax({
      url: APP_PATH + "plugins/yale_accessions/department_codes",
      data: {},
      type: "GET",
      success: function(codes) {
        if (codes.length > 1) {
          var html = "<select id=\"accession_id_1_\" name=\"accession[id_1]\" style=\"width: 100px\">";
          $.each(codes, function(i, code) {
            html += "<option value=\"" + code + "\">" + code + "</option>";
          });

          html += "</select>"
          $('#accession_id_1_').replaceWith(html);
        } else if (codes.length == 1) {
          $('#accession_id_1_').val(codes[0]);
        }
        
      },
    });
  }


  var update_fiscal_year = function (date_string) {
    var date = new Date(date_string);
    var month = date.getMonth();
    var year = (month > 5 && date.getFullYear()) || (date.getFullYear() - 1);

    $id_0.val(year);
  }


  init();

  // Whenever the accession date changes, update id_0 with the fiscal year
 
  var $fld = $('input#accession_accession_date_');

  $fld.change( function(event) {
    update_fiscal_year($fld.val());
  });

  var $btn = $fld.next('button');

  $btn.datepicker().on("changeDate", function() {
    update_fiscal_year($fld.val());
  });

})

