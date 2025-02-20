document.querySelectorAll('[data-confirm-delete]').forEach(x=>x.addEventListener('click',e=>{if(!confirm('Delete this record?'))e.preventDefault();}));
