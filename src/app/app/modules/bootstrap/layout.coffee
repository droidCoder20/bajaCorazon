dependencies = ['marionette', './templates/layout']

define dependencies, (Mn, TemplateLayout)->

  class Layout extends Mn.LayoutView

    el: 'body'
    template: TemplateLayout
    regions:
      header: 'header'
      content:'#content'
      nav: 'nav'
      footer: 'footer'

  return Layout