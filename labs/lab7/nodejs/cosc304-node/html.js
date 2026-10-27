// Small helpers for generating HTML in these introductory Express examples.
function escapeHtml(value) {
    return String(value ?? '').replace(/[&<>"']/g, char => ({
        '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;'
    })[char]);
}

const currencyFormat = new Intl.NumberFormat('en-CA', {
    style: 'currency', currency: 'CAD'
});

function formatCurrency(value) {
    return currencyFormat.format(Number(value));
}

function htmlPage(title, body) {
    return `<!DOCTYPE html><html lang="en"><head><meta charset="utf-8">
<title>${escapeHtml(title)}</title></head><body>${body}</body></html>`;
}

module.exports = { escapeHtml, formatCurrency, htmlPage };
