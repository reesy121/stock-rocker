$(document).ready(function() {
  $("#categories a.add_fields").
      data("association-insertion-position", 'before').
      data("association-insertion-node", 'this');

    $('#categories').bind('cocoon:after-insert',
         function(e, tag) {
             console.log('inserting new tag ...');
             $(".categorization-fields a.add-tag").
                 data("association-insertion-position", 'after').
                 data("association-insertion-node", 'this');
             $(this).find('.categorization-fields').bind('cocoon:after-insert',
                  function() {
                    console.log('insert new tag ...');
                    console.log($(this));
                    $(this).find(".category_from_list").remove();
                    $(this).find("a.add_fields").hide();
                  });
         });

    $('.categorization-fields').bind('cocoon:after-insert',
        function(e) {
            console.log('replace OLD tag ...');
            e.stopPropagation();
            console.log($(this));
            $(this).find(".category_from_list").remove();
            $(this).find("a.add_fields").hide();
        })
});