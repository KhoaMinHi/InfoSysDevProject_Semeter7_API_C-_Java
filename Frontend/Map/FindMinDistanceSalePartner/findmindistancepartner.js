const Pagination = {
  name: 'pagination',
  template: '#pagination',
  props: {
    maxVisibleButtons: {
      type: Number,
      required: false,
      default: 3
    },
    totalPages: {
      type: Number,
      required: true
    },
    total: {
      type: Number,
      required: true
    },
    perPage: {
      type: Number,
      required: true
    },
    currentPage: {
      type: Number,
      required: true
    },
  },
  computed: {
    startPage() {
      if (this.currentPage === 1) {
        return 1;
      }

      if (this.currentPage === this.totalPages) {
        return this.totalPages - this.maxVisibleButtons + 1;
      }

      return this.currentPage - 1;

    },
    endPage() {

      return Math.min(this.startPage + this.maxVisibleButtons - 1, this.totalPages);

    },
    pages() {
      const range = [];

      for (let i = this.startPage; i <= this.endPage; i += 1) {
        range.push({
          name: i,
          isDisabled: i === this.currentPage
        });
      }

      return range;
    },
    isInFirstPage() {
      return this.currentPage === 1;
    },
    isInLastPage() {
      return this.currentPage === this.totalPages;
    },
  },
  methods: {
    onClickFirstPage() {
      this.$emit('pagechanged', 1);
    },
    onClickPreviousPage() {
      this.$emit('pagechanged', this.currentPage - 1);
    },
    onClickPage(page) {
      this.$emit('pagechanged', page);
    },
    onClickNextPage() {
      this.$emit('pagechanged', this.currentPage + 1);
    },
    onClickLastPage() {
      this.$emit('pagechanged', this.totalPages);
    },
    isPageActive(page) {
      return this.currentPage === page;
    },
  }
};

new Vue({
  el: '#app',
  name: 'app',
  components: {
    pagination: Pagination,
  },
  data() {
    return {
      baseUrl: 'http://localhost:8080/api/mindistancepartner',
      currentPage: 1,
      perPage: 2,
      totalPages: 10,
      total: 100,
      partners: null,
      partnerCols: ['MaDoiTacBanHang', 'TenDoiTacBH', 'SDTDoiTacBH', 'DiaChi', 'Latitude', 'Longtitude', 'MinDistance']
    };
  },
  methods: {
    onPageChange(page) {
      console.log(page)
      this.currentPage = page;
      this.getData();
    },

    getData() {
      try {
        fetch(`${this.baseUrl}/${this.currentPage}/${this.perPage}`)
          .then(response => {

            if (response.ok) {
              return response.json()
            } else {

              alert("Server returned " + response.status + " : " + response.statusText);
            }
          }).then(response => {
            this.partners = JSON.parse(JSON.stringify(response));
          });
      }
      catch (err) {
        console.log(err);
      }
    },
  },
});