$(document).ready(function () {
    $(document).on('click', '.btn-submit-form', function (event) {
        event.preventDefault();

        $.ajax({
            type: 'POST',
            url: $('.new_message').attr('action'),
            data: $('.new_message').serialize(),
            dataType: 'json',
            success: function (response) {
                $('.list-message').append(response.data.message);
                $('.new_message').find('input[type="text"]').val('');
            }
        });
    });
});