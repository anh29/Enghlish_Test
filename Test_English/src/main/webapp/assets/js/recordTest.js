var currentPage = 0;
var itemsPerPage = 4; // Change this to the number of items you want per page
var resultItems = document.querySelectorAll('.result-item');

function showPage(page) {
    var startIndex = page * itemsPerPage;
    var endIndex = startIndex + itemsPerPage;

    resultItems.forEach(function (item, index) {
        item.style.display = (index >= startIndex && index < endIndex) ? 'block' : 'none';
    });
}

function nextPage() {
    currentPage++;
    showPage(currentPage);
}

function prevPage() {
    if (currentPage > 0) {
        currentPage--;
        showPage(currentPage);
    }
}

// Initial display
showPage(currentPage);
