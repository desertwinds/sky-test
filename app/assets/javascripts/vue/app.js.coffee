#= require vue
#= require moment
#= require ./filters
#= require_tree ./components

$(document).ready ->
  new Vue(
    el: '#vue-sky'
    data:
      {
        currentView: "statement-overview"
        statement: {}
        package: {}
        calls: {}
        store: {}
        errors: {}
        showBill: false
      }
    methods: 
      toggleView: (view) ->
        this.currentView = view
      getMyData: () ->
        switch this.currentView
          when 'statement-overview'
            this.statement
          when 'package-breakdown'
            this.package
          when 'calls-breakdown'
            this.calls
          when 'store-breakdown'
            this.store

    ready: ->
      myInstance = this
      $.ajax
        url: '/bill.json'
        success: (res) ->
          if !res["errors"]
            console.log(res)
            myInstance.statement = res["statement"]
            myInstance.package = res["package"]
            myInstance.calls = res["callCharges"]
            myInstance.store = res["skyStore"]
            myInstance.showBill = true
          else
            myInstance.errors = res
    )

    
