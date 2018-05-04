sub RunUserInterface(params as Object)
    m.screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    m.screen.setMessagePort(m.port)
    scene = m.screen.CreateScene("AppScene")
    data = ParseJson(ReadAsciiFile("pkg:/assets/raw/api.json"))
    m.screen.GetGlobalNode().addFields({
      api: data
    })
    m.screen.show()

    checkForUnitTests(params)

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
