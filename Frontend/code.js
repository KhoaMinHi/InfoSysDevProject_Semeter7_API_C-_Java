const app = new Vue({
    el: '#main',
    data: {
        dept: null,
        emp:null,
        responseAvailable: false
    },
    methods: {
        fetchAPIData() {
            
            this.responseAvailable = false;
            fetch("https://localhost:44383/api/dept", {
                "method": "GET"
            })
                .then(response => {
                    
                    if (response.ok) {
                        return response.json()
                    } else {
                        
                        alert("Server returned " + response.status + " : " + response.statusText);
                    }
                })
                .then(response => {
                  
                    this.dept = JSON.parse(JSON.stringify(response));
                    this.responseAvailable = true;       
                               
                })
                .catch(err => {
                    console.log(err);
                });

        },

        fetchAPIData2() {
            
            this.responseAvailable = false;
            fetch("http://localhost:8080/api/nhanvien", {
                "method": "GET"                
                
            })
                .then(response => {
                    
                    if (response.ok) {
                        return response.json()
                    } else {
                        
                        alert("Server returned " + response.status + " : " + response.statusText);
                    }
                })
                .then(response => {
                  
                    this.emp = JSON.parse(JSON.stringify(response));
                    this.responseAvailable = true;       
                               
                })
                .catch(err => {
                    console.log(err);
                });

        }

    }
})