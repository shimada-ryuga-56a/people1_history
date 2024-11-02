import { Application } from '@hotwired/stimulus'
import RailsNestedForm from '@stimulus-components/rails-nested-form'
import { Autocomplete } from 'stimulus-autocomplete'

const application = Application.start()
application.register('nested-form', RailsNestedForm)
application.register('autocomplete', Autocomplete)