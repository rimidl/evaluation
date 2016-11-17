#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require bootstrap
#= require jquery-fileupload/basic
#= require cocoon

$ ->
  $('.js-file-uploader').fileupload
    sequentialUploads: true
    add: (e, data) ->
      data.submit()
    done: (e, data) ->
      $('.js-files').append $(data.result)
