// Application : wxPluginManager
// wxEditorHandler.prg , Created : 16/12/2024   10:27
Using System
Using System.Windows.Forms
Using Xide.PluginSystem

Begin NameSpace wxPlugins.wxEditorKit
	Class wxEditorHandler Inherit Plugin
		Private oService As PluginService
		Override Property Name As String 
			Get 
				Return "wxEditorHandler"
			End Get
		End Property
		
		Method Initialize(_Service As PluginService) As Void
			Self:oService := _Service
			Self:oService:IdeForm:KeyDown += Self:HandleKeyDown
			Self:oService:IdeForm:KeyPreview := True
		End Method
		
		Method HandleKeyDown(oSender As Object, oArgs As KeyEventArgs) As Void
			Local oEditor := Self:oService:ActiveFilePad:Editor As Editor
			If oEditor == Null
				Return
			EndIf
			
			If oArgs:Control && !oArgs:Alt && !oArgs:Shift
				Local nX := 0, nY := 0 As Int
				Do Case
				Case oArgs:KeyCode == Keys.Down
					oEditor:GetCaretPos(Ref nX, Ref nY)
					oEditor:MoveCaretTo(nX, nY+1)
				Case oArgs:KeyCode == Keys.Up
					oEditor:GetCaretPos(Ref nX, Ref nY)
					oEditor:MoveCaretTo(nX, nY-1)
				End Case				
			EndIf
		End Method
	End Class
End NameSpace
