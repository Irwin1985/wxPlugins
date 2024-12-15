// Application : wxGuidGenerator
// FrmGuidGenerator.prg , Created : 15/12/2024   14:28
// User : irwin
Using System
Using System.Drawing
Using System.Windows.Forms

Partial Class FrmGuidGenerator Inherit System.Windows.Forms.Form
    
	Private cSelected As String

	Constructor()	
		Super()	
		Self:InitializeForm()
		Self:oRadioButton5:Checked := True
		Self:cSelected := "radiobutton5"
		Self:GenerateNewGuid()
	Return
	
	/// Copy
	Method Button1_Click(sender As System.Object , e As System.EventArgs) As Void
		Clipboard.SetText(oLabelOutput:Text)
	End Method

	/// GenerateNewGuid
	Method Button2_Click(sender As System.Object , e As System.EventArgs) As Void
		Self:GenerateNewGuid()
	End Method

	/// Exit
	Method Button3_Click(sender As System.Object , e As System.EventArgs) As Void
		Self:Close()
	End Method
	
	Private Method GenerateNewGuid As Void
		Local lcFormat As String
		Switch Self:cSelected
		Case "radiobutton1" // IMPLEMENT_OLECREATE
			lcFormat := Self:CreateOleGuidFormat()
		Case "radiobutton2" // DEFINE_GUID
			lcFormat := Self:CreateDefineGuidFormat()
		Case "radiobutton3" // STATIS
			lcFormat := Self:CreateStaticGuidFormat()
		Case "radiobutton4" //
			lcFormat := Guid.NewGuid():ToString("D"):ToUpper()
			lcFormat := "{" + lcFormat + "}"
		Case "radiobutton5"
			lcFormat := String.Format("[Guid(""{0}"")]", Guid.NewGuid():ToString("D"):ToUpper())
		Case "radiobutton6"
			lcFormat := String.Format("<Guid(""{0}"")>", Guid.NewGuid():ToString("D"):ToUpper())
		Otherwise
			lcFormat := ""
		End Switch
		If String.IsNullOrEmpty(lcFormat)
			Return
		EndIf
		Self:oLabelOutput:Text := lcFormat
		Self:oLabelOutput:Visible := True
	End Method

	Private Method CreateOleGuidFormat As String
		Var lcGuid := Guid.NewGuid():ToString("N"):ToUpperInvariant()
		Var lcMacro := ""	
		Text To lcMacro
	IMPLEMENT_OLECREATE(<<Class>>, <<external_name>>,
	0x{0:X8}, 0x{1:X4}, 0x{2:X4}, 0x{3:X2}, 0x{4:X2}, 0x{5:X2}, 0x{6:X2}, 0x{7:X2}, 0x{8:X2}, 0x{9:X2}, 0x{10:X2})
		EndText
		Var lcResult := string.Format(lcMacro, ;
			lcGuid:Substring(0,8),;
			lcGuid:Substring(8,4),;
			lcGuid:Substring(12,4),;
			lcGuid:Substring(16,2),;
			lcGuid:Substring(18,2),;
			lcGuid:Substring(20,2),; 
			lcGuid:Substring(22,2),; 
			lcGuid:Substring(24,2),;
			lcGuid:Substring(26,2),;
			lcGuid:Substring(28,2),;
			lcGuid:Substring(30,2))
		lcResult := ei"//{{{lcGuid}}}\r\n{lcResult};"
		Return lcResult
	End Method
	
	Private Method CreateDefineGuidFormat As String
		Var lcGuid := Guid.NewGuid():ToString("N"):ToUpperInvariant()
		Var lcMacro := ""	
		Text To lcMacro
	DEFINE_GUID(<<name>>, 0x{0:X8}, 0x{1:X4}, 0x{2:X4}, 0x{3:X2}, 0x{4:X2}, 0x{5:X2}, 0x{6:X2}, 0x{7:X2}, 0x{8:X2}, 0x{9:X2}, 0x{10:X2})
		EndText
		Var lcResult := string.Format(lcMacro, ;
			lcGuid:Substring(0,8),;
			lcGuid:Substring(8,4),;
			lcGuid:Substring(12,4),;
			lcGuid:Substring(16,2),;
			lcGuid:Substring(18,2),;
			lcGuid:Substring(20,2),; 
			lcGuid:Substring(22,2),; 
			lcGuid:Substring(24,2),;
			lcGuid:Substring(26,2),;
			lcGuid:Substring(28,2),;
			lcGuid:Substring(30,2))
		lcResult := ei"//{{{lcGuid}}}\r\n{lcResult};"
		Return lcResult
	End Method
	
	Private Method CreateStaticGuidFormat As String
		Var lcGuid := Guid.NewGuid():ToString("N"):ToUpperInvariant()
		Var lcMacro := ""	
		Text To lcMacro
	Static Const GUID <<name>> = {11}0x{0:X8}, 0x{1:X4}, 0x{2:X4}, {11}0x{3:X2}, 0x{4:X2}, 0x{5:X2}, 0x{6:X2}, 0x{7:X2}, 0x{8:X2}, 0x{9:X2}, 0x{10:X2}{12}{12}
		EndText
		Var lcResult := string.Format(lcMacro, ;
			lcGuid:Substring(0,8),;
			lcGuid:Substring(8,4),;
			lcGuid:Substring(12,4),;
			lcGuid:Substring(16,2),;
			lcGuid:Substring(18,2),;
			lcGuid:Substring(20,2),; 
			lcGuid:Substring(22,2),; 
			lcGuid:Substring(24,2),;
			lcGuid:Substring(26,2),;
			lcGuid:Substring(28,2),;
			lcGuid:Substring(30,2),;
			"{","}")
		lcResult := ei"//{{{lcGuid}}}\r\n{lcResult};"
		Return lcResult
	End Method

	Method RadioButton_Click(sender As System.Object , e As System.EventArgs) As Void
		Self:cSelected := ((Control)sender):Name:ToLower()
		Self:GenerateNewGuid()
	End Method


End Class

