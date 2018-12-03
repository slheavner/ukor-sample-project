sub init()
  m.data = m.global.api
  m.api = api()
  m.tracker = m.top.createChild("TrackerTask")
  m.grid = m.top.findNode("contentGrid")
  m.videoPlayer = m.top.findNode("videoPlayer")
  m.grid.observeField("itemSelected", "onVideoSelected")
  m.grid.content = m.api.newVideoGrid(m.data)
  m.grid.setFocus(true)
end sub

function onKeyEvent(key as string, press as boolean)
  if key = "back" and m.videoPlayer.hasFocus() = true then
    m.videoPlayer.setFields({
      visible: false,
      control: "pause"
    })
    m.grid.setFocus(true)
    return true
  end if
  return false
end function

sub onVideoSelected(msg as object)
  playVideo(m.data.categories[0].videos[m.grid.itemSelected])
end sub

sub playVideo(video as object)
  m.videoPlayer.setFields(m.api.newVideoPlayAction(video))
  m.videoPlayer.setFocus(true)
end sub
