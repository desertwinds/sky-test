Vue.component 'store-breakdown',
  template: '#store-breakdown'
  data: -> 
    {
      currentPage: 1,
      totalPages: 1,
      itemsPerPage: 10,
      currentFilter: 'rentals',
      currentData: []
    }
  props: ['data']
  ready: () ->
    this.currentData = this.data.rentals
    this.totalPages = (this.currentData.length) / this.itemsPerPage
  watch: 
    {
      'itemsPerPage': (val, oldVal) ->
        this.currentPage = 1
        this.totalPages = (this.currentData.length) / val

      'currentFilter': (val, oldVal) ->
        this.currentPage = 1
        switch val
          when 'rentals' then this.currentData = this.data.rentals
          when 'buyAndKeep' then this.currentData = this.data.buyAndKeep
        
        this.totalPages = (this.currentData.length) / this.itemsPerPage
    }
  