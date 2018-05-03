sub init()
  m.api = m.global.api
  ? m.api
  m.tracker = m.top.createChild("TrackerTask")
  m.top.backgroundUri = m.api.root + m.api.categories[0].videos[0].thumb
end sub
