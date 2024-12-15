// Application : wxGuidGenerator
// wxGuidGeneratorPlugin.prg , Created : 15/12/2024   14:13

Using System
Using System.Windows.Forms
Using Xide.PluginSystem

Begin NameSpace wxPlugins.wxGuidGenerator
	Class wxGuidGeneratorPlugin Inherit Plugin
		Protect oService As PluginService
		
		Override Property Name As String
			Get
				Return "wxGuidGenerator"
			End Get
		End Property
		
		Override Method Initialize(_oService As PluginService) As Void
			 Self:oService := _oService
			 
			 // Register the item under the Tools main menu
			 Local oMenuItem := MenuItem{"-"} As MenuItem
			 Self:oService:RegisterMenuItem(MainMenuItem.Tools, oMenuItem)
			 
			 oMenuItem := MenuItem{"Create GUID", Self:ShowGuidGenerator}
			 Self:oService:RegisterMenuItem(MainMenuItem.Tools, oMenuItem)
			 
		End Method
		
		Method OnEditorContextMenuPopup As MenuItem[]
			Local oMenuItem := MenuItem{"Generate GUID", Self:InsertGuidAtCursor} As MenuItem

			Return <MenuItem>{oMenuItem}
		End Method
		
		Method ShowGuidGenerator(sender As Object, e As EventArgs) As Void
			Local oForm := FrmGuidGenerator{} As FrmGuidGenerator
			oForm:ShowDialog()
		End Method
		
		Method InsertGuidAtCursor(sender As Object, e As EventArgs) As Void
			Try
				Local cGuid := Guid.NewGuid():ToString("D") As String 
				Local oFilePad := Self:oService:GetActiveFilePad() As FilePad
				If oFilePad == Null
					Return
				EndIf
				
				Local oEditor := oFilePad:Editor As Editor
				If oEditor == Null
					Return
				EndIf
				
				ForEach c As Char In cGuid
					oEditor:TypeChar(c)
				Next
			Catch To loEx
				MessageBox.Show(loEx:Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
			End Try
		End Method
	End Class
End NameSpace
