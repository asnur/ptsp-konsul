<script src="https://js.pusher.com/7.0.3/pusher.min.js"></script>
<script>
    // Enable pusher logging - don't include this in production
    Pusher.logToConsole = true;

    var pusher = new Pusher("{{ config('chatify.pusher.key') }}", {
        encrypted: true,
        cluster: "{{ config('chatify.pusher.options.cluster') }}",
        authEndpoint: '{{ route('pusher.auth') }}',
        auth: {
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        }
    });
</script>
<script src="{{ asset('js/chatify/code.js') }}"></script>
<script>
    // Messenger global variable - 0 by default
    messenger = "{{ @$id }}";
    id_admin = "{{ @$id_admin }}";
    if (id_admin != 0) {
        $(window).on("load", function() {
            $(`.messenger-list-item[data-contact='${id_admin}']:eq(0)`).hide();
            $(`.messenger-list-item[data-contact='${id_admin}']`).trigger("click");
            $(`.messenger-list-item[data-contact='${id_admin}']`).on("click", function() {
                console.log("test");
            });
        });
    }
</script>
