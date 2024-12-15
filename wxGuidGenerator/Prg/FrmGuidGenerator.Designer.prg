// Application : wxGuidGenerator
// FrmGuidGenerator.prg , Created : 15/12/2024   14:28
// User : irwin

PARTIAL CLASS FrmGuidGenerator INHERIT System.Windows.Forms.Form

	PROTECT oGroupBox2 AS System.Windows.Forms.GroupBox
	PROTECT oLabelOutput AS System.Windows.Forms.Label
	PROTECT oGroupBox1 AS System.Windows.Forms.GroupBox
	PROTECT oRadioButton6 AS System.Windows.Forms.RadioButton
	PROTECT oRadioButton5 AS System.Windows.Forms.RadioButton
	PROTECT oRadioButton4 AS System.Windows.Forms.RadioButton
	PROTECT oRadioButton3 AS System.Windows.Forms.RadioButton
	PROTECT oRadioButton2 AS System.Windows.Forms.RadioButton
	PROTECT oRadioButton1 AS System.Windows.Forms.RadioButton
	PROTECT oButton3 AS System.Windows.Forms.Button
	PROTECT oButton2 AS System.Windows.Forms.Button
	PROTECT oButton1 AS System.Windows.Forms.Button
	PROTECT oLabel1 AS System.Windows.Forms.Label
	// User code starts here (DO NOT remove this line)  ##USER##

METHOD InitializeForm() AS VOID
	
	// IDE generated code (please DO NOT modify)
	
		SELF:oGroupBox2 := System.Windows.Forms.GroupBox{}
		SELF:oLabelOutput := System.Windows.Forms.Label{}
		SELF:oGroupBox1 := System.Windows.Forms.GroupBox{}
		SELF:oRadioButton6 := System.Windows.Forms.RadioButton{}
		SELF:oRadioButton5 := System.Windows.Forms.RadioButton{}
		SELF:oRadioButton4 := System.Windows.Forms.RadioButton{}
		SELF:oRadioButton3 := System.Windows.Forms.RadioButton{}
		SELF:oRadioButton2 := System.Windows.Forms.RadioButton{}
		SELF:oRadioButton1 := System.Windows.Forms.RadioButton{}
		SELF:oButton3 := System.Windows.Forms.Button{}
		SELF:oButton2 := System.Windows.Forms.Button{}
		SELF:oButton1 := System.Windows.Forms.Button{}
		SELF:oLabel1 := System.Windows.Forms.Label{}

		SELF:SuspendLayout()

		SELF:ClientSize := System.Drawing.Size{392 , 328}
		SELF:Location := System.Drawing.Point{100 , 100}
		SELF:Name := "FrmGuidGenerator"
		SELF:StartPosition := System.Windows.Forms.FormStartPosition.CenterScreen
		SELF:Text := "Create GUID"

		SELF:oGroupBox2:SuspendLayout()
		SELF:oGroupBox2:Location := System.Drawing.Point{8 , 240}
		SELF:oGroupBox2:Name := "GroupBox2"
		SELF:oGroupBox2:Size := System.Drawing.Size{376 , 80}
		SELF:oGroupBox2:TabIndex := 5
		SELF:oGroupBox2:Text := "Result"
		SELF:Controls:Add(SELF:oGroupBox2)
		

		SELF:oLabelOutput:BackColor := System.Drawing.Color.Transparent
		SELF:oLabelOutput:Location := System.Drawing.Point{8 , 16}
		SELF:oLabelOutput:Name := "LabelOutput"
		SELF:oLabelOutput:Size := System.Drawing.Size{360 , 52}
		SELF:oLabelOutput:TabIndex := 0
		SELF:oLabelOutput:Visible := False
		SELF:oGroupBox2:Controls:Add(SELF:oLabelOutput)
		
		SELF:oGroupBox1:SuspendLayout()
		SELF:oGroupBox1:Location := System.Drawing.Point{8 , 80}
		SELF:oGroupBox1:Name := "GroupBox1"
		SELF:oGroupBox1:Size := System.Drawing.Size{288 , 152}
		SELF:oGroupBox1:TabIndex := 4
		SELF:oGroupBox1:Text := "GUI Format"
		SELF:Controls:Add(SELF:oGroupBox1)
		

		SELF:oRadioButton6:AutoSize := True
		SELF:oRadioButton6:BackColor := System.Drawing.Color.Transparent
		SELF:oRadioButton6:Click += SELF:RadioButton_Click
		SELF:oRadioButton6:Location := System.Drawing.Point{8 , 122}
		SELF:oRadioButton6:Name := "RadioButton6"
		SELF:oRadioButton6:Size := System.Drawing.Size{192 , 18}
		SELF:oRadioButton6:TabIndex := 5
		SELF:oRadioButton6:Text := e"&6. <Guid(\"xxxxxxx-xxxx ... xxxx\")>"
		SELF:oGroupBox1:Controls:Add(SELF:oRadioButton6)
		
		SELF:oRadioButton5:AutoSize := True
		SELF:oRadioButton5:BackColor := System.Drawing.Color.Transparent
		SELF:oRadioButton5:Click += SELF:RadioButton_Click
		SELF:oRadioButton5:Location := System.Drawing.Point{8 , 103}
		SELF:oRadioButton5:Name := "RadioButton5"
		SELF:oRadioButton5:Size := System.Drawing.Size{185 , 18}
		SELF:oRadioButton5:TabIndex := 4
		SELF:oRadioButton5:Text := e"&5. [Guid(\"xxxxxxx-xxxx ... xxxx\")]"
		SELF:oGroupBox1:Controls:Add(SELF:oRadioButton5)
		
		SELF:oRadioButton4:AutoSize := True
		SELF:oRadioButton4:BackColor := System.Drawing.Color.Transparent
		SELF:oRadioButton4:Click += SELF:RadioButton_Click
		SELF:oRadioButton4:Location := System.Drawing.Point{8 , 84}
		SELF:oRadioButton4:Name := "RadioButton4"
		SELF:oRadioButton4:Size := System.Drawing.Size{256 , 18}
		SELF:oRadioButton4:TabIndex := 3
		SELF:oRadioButton4:Text := "&4. Registry Format (ie. {xxxxxxx-xxxx ... xxxx })"
		SELF:oGroupBox1:Controls:Add(SELF:oRadioButton4)
		
		SELF:oRadioButton3:AutoSize := True
		SELF:oRadioButton3:BackColor := System.Drawing.Color.Transparent
		SELF:oRadioButton3:Click += SELF:RadioButton_Click
		SELF:oRadioButton3:Location := System.Drawing.Point{8 , 65}
		SELF:oRadioButton3:Name := "RadioButton3"
		SELF:oRadioButton3:Size := System.Drawing.Size{189 , 18}
		SELF:oRadioButton3:TabIndex := 2
		SELF:oRadioButton3:Text := "&3. static const struct GUID = { ... }"
		SELF:oGroupBox1:Controls:Add(SELF:oRadioButton3)
		
		SELF:oRadioButton2:AutoSize := True
		SELF:oRadioButton2:BackColor := System.Drawing.Color.Transparent
		SELF:oRadioButton2:Click += SELF:RadioButton_Click
		SELF:oRadioButton2:Location := System.Drawing.Point{8 , 46}
		SELF:oRadioButton2:Name := "RadioButton2"
		SELF:oRadioButton2:Size := System.Drawing.Size{128 , 18}
		SELF:oRadioButton2:TabIndex := 1
		SELF:oRadioButton2:Text := "&2. DEFINE_GUID(...)"
		SELF:oGroupBox1:Controls:Add(SELF:oRadioButton2)
		
		SELF:oRadioButton1:AutoSize := True
		SELF:oRadioButton1:BackColor := System.Drawing.Color.Transparent
		SELF:oRadioButton1:Click += SELF:RadioButton_Click
		SELF:oRadioButton1:Location := System.Drawing.Point{8 , 27}
		SELF:oRadioButton1:Name := "RadioButton1"
		SELF:oRadioButton1:Size := System.Drawing.Size{193 , 18}
		SELF:oRadioButton1:TabIndex := 0
		SELF:oRadioButton1:Text := "&1. IMPLEMENT_OLECREATE(...)"
		SELF:oGroupBox1:Controls:Add(SELF:oRadioButton1)
		
		SELF:oButton3:Click += SELF:Button3_Click
		SELF:oButton3:Location := System.Drawing.Point{304 , 54}
		SELF:oButton3:Name := "Button3"
		SELF:oButton3:Size := System.Drawing.Size{80 , 24}
		SELF:oButton3:TabIndex := 3
		SELF:oButton3:Text := "&Exit"
		SELF:Controls:Add(SELF:oButton3)
		
		SELF:oButton2:Click += SELF:Button2_Click
		SELF:oButton2:Location := System.Drawing.Point{304 , 30}
		SELF:oButton2:Name := "Button2"
		SELF:oButton2:Size := System.Drawing.Size{80 , 24}
		SELF:oButton2:TabIndex := 2
		SELF:oButton2:Text := "&New GUID"
		SELF:Controls:Add(SELF:oButton2)
		
		SELF:oButton1:Click += SELF:Button1_Click
		SELF:oButton1:Location := System.Drawing.Point{304 , 6}
		SELF:oButton1:Name := "Button1"
		SELF:oButton1:Size := System.Drawing.Size{80 , 24}
		SELF:oButton1:TabIndex := 1
		SELF:oButton1:Text := "&Copy"
		SELF:Controls:Add(SELF:oButton1)
		
		SELF:oLabel1:BackColor := System.Drawing.Color.Transparent
		SELF:oLabel1:Location := System.Drawing.Point{8 , 8}
		SELF:oLabel1:Name := "Label1"
		SELF:oLabel1:Size := System.Drawing.Size{290 , 40}
		SELF:oLabel1:TabIndex := 0
		SELF:oLabel1:Text := e"Choose the desired format below, then select \"Copy\" to copy the result to the clipboard (the results can then be pasted into your source code). Choose \"Exit\" when done."
		SELF:Controls:Add(SELF:oLabel1)
		
		SELF:oGroupBox1:ResumeLayout()
		SELF:oGroupBox2:ResumeLayout()
		SELF:ResumeLayout()

	END METHOD

END CLASS

