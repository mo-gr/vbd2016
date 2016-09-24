define([], function() {
    return function(el) {
        fetch('/api/slow')
            .then(r => r.json())
            .then(r => el.querySelector('.slow').innerText = r)
            .catch(e => console.error(e));
    }
});
