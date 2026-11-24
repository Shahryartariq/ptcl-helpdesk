// PCS: opens and closes the side menu on phones
(function () {
    var body = document.body;
    function close() { body.classList.remove('pcs-nav-open'); }
    document.addEventListener('click', function (e) {
        if (e.target.closest('[data-pcs-menu]')) { body.classList.toggle('pcs-nav-open'); }
        else if (e.target.closest('[data-pcs-close]')) { close(); }
    });
    document.addEventListener('keydown', function (e) { if (e.key === 'Escape') close(); });
})();
