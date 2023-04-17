/**
 * 
 */
		/* alert */
		document.getElementById("modal-button").addEventListener('click',function(){
			document.getElementById('modal-alert').style.display = 'none';
		})
		
		document.getElementById('modal-alert').addEventListener("click", e => {
	    const evTarget = e.target
	    if(!evTarget.classList.contains("modal-container")) {
	    	document.getElementById('modal-alert').style.display = 'none';
		    }
		})
		
		function khalert(a){
			document.getElementById('modal-content').innerHTML = a;
			document.getElementById('modal-alert').style.display = 'flex';
		}
		
		/* confirm */
		
		
		
		document.getElementById("modal-yes-button").addEventListener('click',function(){
			document.getElementById('modal-confirm').style.display = 'none';
			return true;
		})
		
		document.getElementById('modal-confirm').addEventListener("click", e => {
	    const evTarget = e.target
	    if(!evTarget.classList.contains("modal-container")) {
	    	document.getElementById('modal-confirm').style.display = 'none';
		    }
		})
		
		function khconfirm(a){
		
			document.getElementById('modal-confirm-content').innerHTML = a;
			document.getElementById('modal-confirm').style.display = 'flex';
			
			}
		
	