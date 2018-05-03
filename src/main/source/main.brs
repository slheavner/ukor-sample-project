sub RunUserInterface(params as Object)
  showChannelSGScreen(params)
end sub

sub showChannelSGScreen(params as Object)
    m.screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    m.screen.setMessagePort(m.port)
    scene = m.screen.CreateScene("AppScene")
    api = ParseJson(ReadAsciiFile("pkg:/assets/raw/api.json"))
    m.screen.GetGlobalNode().addFields({
      api: api
    })
    m.screen.show()

    if params.RunTests = "true"
        runner = TestRunner()
        if params.host <> invalid
          runner.logger.SetServer(params.host, params.port, params.protocol)
        else
          runner.logger.SetServerURL(param.url)
        end if
        runner.run()
    end if

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent" then
            if msg.isScreenClosed() then
              return
            end if
        end if
    end while
end sub
