import { Application } from '@hotwired/stimulus'
import { Autocomplete } from 'stimulus-autocomplete'
import RailsNestedForm from '@stimulus-components/rails-nested-form'
import Dialog from '@stimulus-components/dialog'

const application = Application.start()
application.register('nested-form', RailsNestedForm)
application.register('autocomplete', Autocomplete)
application.register('dialog', Dialog)