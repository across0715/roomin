require('@rails/ujs').start()
require('turbolinks').start()
require('@rails/activestorage').start()
require('channels')

document.addEventListener('turbolinks:load', () => {
  const selectedLocale = document.getElementById('selectedLocale')
  selectedLocale.addEventListener('change', (e) => {
    const locale = e.target.value
    const baseUrl = location.href.split('?')[0]
    const url = `${baseUrl}?locale=${locale}`
    window.location.href = url
  })
})
