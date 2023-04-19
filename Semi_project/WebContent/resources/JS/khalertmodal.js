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
			document.getElementById('modal-contents').innerHTML = a;
			document.getElementById('modal-alert').style.display = 'flex';
			$('#modal-button').focus();
		}
		
		$('#modal-button').keyup(function () {
                if (window.event.keyCode == 13) {
                    document.getElementById('modal-alert').style.display = 'none';
                }
            });
		
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
		
		function khconfirm(a, yesbtn, nobtn){
		  
		
			document.getElementById('modal-confirm-content').innerHTML = a;
			document.getElementById('modal-confirm').style.display = 'flex';
			
			function eventHandler(){
				document.getElementById('modal-confirm').style.display = 'none';
				yesbtn();
			}
			function eventCancelHandler(){
				document.getElementById('modal-confirm').style.display = 'none';
				nobtn();
			}		
			document.getElementById("modal-yes-button").addEventListener('click',eventHandler);
			document.getElementById("modal-no-button").addEventListener('click',eventCancelHandler);
			
			document.getElementById('modal-confirm').addEventListener("click", e => {
	   			const evTarget = e.target
	    		if(!evTarget.classList.contains("modal-container")) {
	    			document.getElementById('modal-confirm').style.display = 'none';
	    			document.getElementById("modal-yes-button").removeEventListener('click',eventHandler);
		    	}
		})
		
			document.getElementById("modal-no-button").removeEventListener('click',eventHandler);
		}
		
		
		
		
	