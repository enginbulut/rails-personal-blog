function set_positions() {
  $(".card").each(function(i) {
    $(this).attr("data-pos", i + 1 );
  })
}

$( document ).ready(function() {
  set_positions();
  $(".sortable").sortable();
  $(".sortable").sortable().bind("sortupdate", function(e, i) {
    updated_order = []
    set_positions();
    $(".card").each(function(i) {
      updated_order.push({
        id: $(this).data("id"),
        position: i + 1
      })
    });

    $.ajax({
      type: "PUT",
      url: "/portfolios/sort",
      data: {
        order: updated_order
      }
    });

  });
});
