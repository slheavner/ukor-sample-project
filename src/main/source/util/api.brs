function api()
  return {
    newVideoGridItem: _newVideoGridItem,
    newVideoGrid: _newVideoGrid,
    newVideoPlayAction: _newVideoPlayAction
  }
end function

function _newVideoGridItem(video as object, root as string)
  node = _newContentNode()
  node.setFields({
    hdposterurl: root + video.thumb,
    shortDescriptionLine1: video.title,
    shortDescriptionLine2: video.subtitle
  })
  return node
end function

function _newVideoGrid(data as object)
  root = _newContentNode()
  for each video in data.categories[0].videos
    root.appendChild(_newVideoGridItem(video, data.root))
  end for
  return root
end function

function _newVideoSourceNode(video as object)
  node = _newContentNode()
  node.setFields({
    url: video.sources[0]
  })
  return node
end function

function _newVideoPlayAction(video as object)
  return {
    visible: true,
    control: "play",
    content: _newVideoSourceNode(video)
  }
end function

function _newContentNode()
  return CreateObject("RoSGNode", "ContentNode")
end function
