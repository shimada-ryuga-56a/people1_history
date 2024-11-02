import { Application } from '@hotwired/stimulus'
import { Autocomplete } from 'stimulus-autocomplete'
import RailsNestedForm from '@stimulus-components/rails-nested-form'

const application = Application.start()
application.register('nested-form', RailsNestedForm)
application.register('autocomplete', Autocomplete)