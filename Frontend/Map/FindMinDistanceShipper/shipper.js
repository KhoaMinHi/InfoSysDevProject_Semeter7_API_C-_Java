const app = new Vue({
    el: '#main',
    data: {
        shipper: null,
        responseAvailable: false
    },
    methods: {
        fetchAPIData() {

            this.responseAvailable = false;
            fetch("http://localhost:8080/api/mindistance", {
                "method": "GET"

            }).then(response => {

                if (response.ok) {
                    return response.json()
                } else {

                    alert("Server returned " + response.status + " : " + response.statusText);
                }
            }).then(response => {

                this.shipper = JSON.parse(JSON.stringify(response));
                this.responseAvailable = true;

            }).catch(err => {
                console.log(err);
            });

        },

        mounted() {
            axios
                .get('http://localhost:8080/api/shipper')
                .then(response => {
                    this.shipper = response.data
                })
                .catch(error => {
                    console.log(error)
                    this.errored = true
                })
                .finally(() => this.loading = false)
        }

    }
})


const shipper = new Vue({
    el: '#shipper',
    data: {
        shipper: null,
        responseAvailable: false
    },
    methods: {
        fetchAPIData() {

            this.responseAvailable = false;
            fetch("http://localhost:8080/api/shipper", {
                "method": "GET"

            }).then(response => {

                if (response.ok) {
                    return response.json()
                } else {

                    alert("Server returned " + response.status + " : " + response.statusText);
                }
            }).then(response => {

                this.shipper = JSON.parse(JSON.stringify(response));
                this.responseAvailable = true;

            }).catch(err => {
                console.log(err);
            });

        }

    }
})