// Application : wxFindReferences
// wxFindReferencesPlugin.prg , Created : 15/12/2024   15:04
// User : irwin
Using System
Using System.IO
Using System.Linq
Using System.Collections.Generic
Using System.Windows.Forms
Using Xide.PluginSystem

Begin NameSpace wxPlugins.wxFindReferences
	Class wxFindReferencesPlugin Inherit Plugin
		Private oService As PluginService		
		
		// Inicialización del plugin
		Method Initialize(_oService As PluginService) As Void
			Self:oService := _oService
		End Method
		
		// Nombre del plugin
		Access Name As String
		Return "Search Refences Plugin"
		
		// Interceptar el menú contextual del editot
		Method OnEditorContextMenuPopup As MenuItem[]
			Local oMenuItem As MenuItem
			oMenuItem := MenuItem{"Find All References", Self:SearchReferences}
			Return <MenuItem>{oMenuItem}
		End Method


		Method SearchReferences(sender As Object, e As EventArgs) As Void
			Local oEditor As Editor
			Local cWord As String
			Local oErrorsPad As ErrorsPad
			Local oFilePad As FilePad
			Local oProject As Project
			Local aReferences As List<Tuple(Int, Int, String)>
			
			// Obtener el editor activo
			oEditor := Self:oService:ActiveFilePad:Editor
			If oEditor == Null
				Return
			EndIf
			
			// Obtener la palabra seleccionada
			cWord := Self:GetSelectedWord(oEditor)
			If string.IsNullOrEmpty(cWord)
				Return
			EndIf
			
			// Inicializar el ErrorsPad			
			oErrorsPad := Self:oService:GetErrorsPad()
			
			oErrorsPad:Clear()			
			
			// Search references in the opened file
			oFilePad := Self:oService:ActiveFilePad
			aReferences := Self:FindWordInFile(oFilePad, cWord)
			ForEach oRef As (Int,Int,String) In aReferences
				oErrorsPad:AddWarning(oRef:Item3, oRef:Item1, oRef:Item2, oFilePad:AppFile:FileName)
			Next
			
			// Search references in the current project
			oProject := Self:oService:ActiveProject
			If oProject != Null
				Var lcActiveAppName := Self:oService:ActiveFilePad:Application:AssemblyName
				Local loActiveApp := Null As Xide.PluginSystem.Application
				
				ForEach loApp As Xide.PluginSystem.Application In Self:oService:ActiveProject:GetApplications()
					If loApp:AssemblyName == lcActiveAppName
						loActiveApp := loApp
						Exit
					EndIf
				Next
				
				If loActiveApp != Null
					ForEach loFile As AppFile In loActiveApp:GetAppFiles()
						Try
							Var cFileContent := File.ReadAllText(loFile:FileName)
							aReferences := FindWordInText(cFileContent, cWord)
							ForEach oRef As (Int,Int,String) In aReferences								
								oErrorsPad:AddWarning(oRef:Item3, oRef:Item1, oRef:Item2, loFile:FileName)
							Next
						Catch
							oErrorsPad:AddMessage(ei"Error reading file: {loFile:FileName}\r\n")
						End Try
					Next
				EndIf 				
			EndIf

			oErrorsPad:MakeVisible()
		End Method
		
		Method FindWordInText(cText As String, cWord As String) As List<(Int, Int, String)>
			Local aResults As List<Tuple(Int, Int, String)>
			Local nLine := 0 As Int
			Local cLine As String
			
			aResults := List<(Int, Int, String)>{}
			Begin Using Var reader := StringReader{cText}
				While (cLine := reader:ReadLine()) != Null
					nLine++
					Local nColumn := cLine:ToUpper():IndexOf(cWord:ToUpper()) As Int
					If cLine:ToUpper():Contains(cWord:ToUpper())
						aResults:Add(Tuple{nLine, nColumn, cLine:Trim()})
					EndIf
				End While
			End Using
			Return aResults
		End Method
		
		
		Method FindWordInFile(oFilePad As FilePad, cWord As String) As List<(Int, Int, String)>
			Local aResults As List<(Int, Int, String)>
			Local nLine As Int
			Local nLinesCount As Int
			Local cLine As String
			
			
			aResults := List<(Int, Int, String)>{}
			If oFilePad == Null
				Return aResults
			EndIf
			nLinesCount := oFilePad:Editor:GetLinesCount()
			
			For nLine := 1 UpTo nLinesCount
				cLine := oFilePad:Editor:GetLine(nLine)
				Local nColumn := cLine:ToUpper():IndexOf(cWord:ToUpper()) + 1 As Int
				If cLine:ToUpper():Contains(cWord:ToUpper())
					aResults:Add(Tuple{nLine, nColumn, cLine:Trim()})
				EndIf
			Next
						
			Return aResults
		End Method
		
		Method GetSelectedWord(oEditor As Editor) As String
			Local oSelection As EditorSelection
			Local cSelectedText As String
			
			oSelection := oEditor:Selection
			If oSelection == Null
				Return ""
			EndIf
			
			cSelectedText := oEditor:GetSelectionStrings()[0]
			Return cSelectedText:Trim()
		End Method		
	End Class
End NameSpace
