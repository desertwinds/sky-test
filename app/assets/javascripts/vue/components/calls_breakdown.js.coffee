Vue.component 'calls-breakdown',
  template: '#calls-breakdown'
  data: -> 
    {
      currentPage: 1,
      totalPages: 1,
      itemsPerPage: 10
    }
  props: ['data']
  ready: () ->
    this.totalPages = (this.data.calls.length) / this.itemsPerPage
  watch: 
    {
      'itemsPerPage': (val, oldVal) ->
        this.currentPage = 1
        this.totalPages = (this.data.calls.length) / val
    }