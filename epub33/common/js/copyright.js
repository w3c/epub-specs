function modifyCopyright() {
    // find the place to put the current year
    const span = document.getElementById("thisyear");
    span.innerHTML = (new Date()).getFullYear();
}
