@php
$name_file = Cookie::get('name_file');
@endphp

<div class="messenger-sendCard">
    <form id="message-form" method="POST" action="{{ route('send.message') }}" enctype="multipart/form-data">
        @csrf
        <label><span class="fas fa-paperclip"></span><input disabled='disabled' type="file" class="upload-attachment"
                name="file" accept="image/*, .txt, .rar, .zip" /></label>
        <textarea readonly='readonly' name="message" class="m-send app-scroll"
            placeholder="Type a message..">{{ Cookie::get('konsul') == null ? '' : "Saya ingin konsultasi mengenai daerah yang tertera pada http://localhost:8000/pdf_file/$name_file" }}</textarea>
        <button disabled='disabled'><span class="fas fa-paper-plane"></span></button>
    </form>
</div>
