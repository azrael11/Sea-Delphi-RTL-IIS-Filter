object WebModuleD: TWebModuleD
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      MethodType = mtGet
      Name = 'Deflate'
      PathInfo = '/TestDeflate'
      OnAction = WebModuleDDefaultHandlerAction
    end
    item
      MethodType = mtGet
      Name = 'NoDeflate'
      PathInfo = '/TestNoDeflate'
      OnAction = WebModuleDWebActionItem1Action
    end
    item
      MethodType = mtGet
      Name = 'HelloWorld'
      PathInfo = '/helloworld'
      OnAction = WebModuleDhelloworldAction
    end>
  Height = 230
  Width = 415
end
