

function ConfirmDelete() {
    var confirmation = confirm("Are you sure ?");
    if (confirmation)
        return true;
    else
        return false;
}