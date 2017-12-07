$(document).ready(() => {
    Clicker.editClicked();
});


class Clicker {

    // on <td> clicked
    static editClicked() {
        $('.uploads__card-table-file-name').click((e) => {
            let content = $(e.target).html();
            let id = $(e.target).data("id");
            $(e.target).html('<input data-id=' + id + ' class="uploads__card-table-file-input" type="text" value="' + content + '" />');
        });
        $(document).on('blur','.uploads__card-table-file-input', (e) => {
            this.saveOnBlur(e.target);
        });
    }

    // on blur, send with AJAX
    static saveOnBlur(element) {

        let id = $(element).data("id");
        let name = $(element).val();
        
        $.ajax({
            type: 'PATCH',
            url: '/uploads/' + id,
            dataType: 'script',
            data: {
                'id': id,
                'file_name': name
            },
        });
    }

}