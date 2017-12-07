// provide class for what we're trying to accomplish
class Clicker {

    // on <td> clicked
    editClicked() {
        $('.uploads__card-table-file-name').click((e) => {
            
            if($(e.target).hasClass('prevent-click')) { return e.preventDefault() }; // prevent default if already clicked
            
            let content = $(e.target).html();
            let id = $(e.target).data("id");
            
            $(e.target)
                .html('<input data-id=' + id + ' class="uploads__card-table-file-input" id="course_title" type="text" value="' + content + '" />')
                .addClass('prevent-click');
        });
        $(document).on('blur','.uploads__card-table-file-input', (e) => {
            this.saveOnBlur(e.target);
        });
    }

    // after blur, send with AJAX
    saveOnBlur(element) {

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

// bombs away
$(document).ready(() => {
    const click = new Clicker();
    return click.editClicked();
});