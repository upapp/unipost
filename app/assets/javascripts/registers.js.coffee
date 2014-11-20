# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$('#city_city_id').parent().hide()
	cities = $('#city_city_id').html()
	$('#country_country_id').change ->
		country = $('#country_country_id :selected').text()
		options = $(cities).filter("optgroup[label='#{country}']").html()
		if options
			$('#city_city_id').html(options)
			$('#city_city_id').parent().show()
		else
			$('#city_city_id').empty()
			$('#city_city_id').parent().hide()