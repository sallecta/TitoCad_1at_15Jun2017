{}
unit guiFormPerspective;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Spin, ExtCtrls, guiFramePaintBox;
type

  { TFormPerspective }

  TFormPerspective = class(TForm)
    btnSetPerspective: TButton;
    btnReadPerspective: TButton;
    btnClearPerspective: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    spnYpos: TSpinEdit;
    spnXpos: TSpinEdit;
    spnAlfa: TFloatSpinEdit;
    spnXoffest: TFloatSpinEdit;
    spnFi: TFloatSpinEdit;
    spnYoffest: TFloatSpinEdit;
    spnZoom: TFloatSpinEdit;
    Timer1: TTimer;
    procedure btnSetPerspectiveClick(Sender: TObject);
    procedure btnReadPerspectiveClick(Sender: TObject);
    procedure btnClearPerspectiveClick(Sender: TObject);
    procedure spnAlfaClick(Sender: TObject);
    procedure spnAlfaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
  private
    fraEditor: TfraPaintBox;
  public
    procedure Exec(argFraEditor: TfraPaintBox);
  end;

var
  FormPerspective: TFormPerspective;

implementation
{$R *.lfm}

procedure TFormPerspective.btnReadPerspectiveClick(Sender: TObject);
begin
  spnXpos.Value:= fraEditor.xDes;
  spnYpos.Value:= fraEditor.yDes;

  spnXoffest.Value := fraEditor.xCam;
  spnYoffest.Value := fraEditor.yCam;

  spnAlfa.Value := fraEditor.Alfa;
  spnFi.Value   := fraEditor.Fi;
  spnZoom.Value := fraEditor.Zoom;

end;
procedure TFormPerspective.btnClearPerspectiveClick(Sender: TObject);
begin
  spnAlfa.Value := 0;
  spnFi.Value := 0;
  spnZoom.Value := 1;
  btnSetPerspectiveClick(self);
  fraEditor.PaintBox1.Invalidate;
end;
procedure TFormPerspective.btnSetPerspectiveClick(Sender: TObject);
begin
  fraEditor.xDes := spnXpos.Value;
  fraEditor.yDes := spnYpos.Value;

  fraEditor.xCam  := spnXoffest.Value;
  fraEditor.yCam  := spnYoffest.Value;

  fraEditor.Alfa:=spnAlfa.Value;
  fraEditor.Fi:=spnFi.Value;
  fraEditor.Zoom:=spnZoom.Value;
  fraEditor.PaintBox1.Invalidate;
end;

procedure TFormPerspective.spnAlfaClick(Sender: TObject);
begin
  btnSetPerspectiveClick(self);
end;
procedure TFormPerspective.spnAlfaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  btnSetPerspectiveClick(self);
end;

procedure TFormPerspective.Timer1Timer(Sender: TObject);
begin
//  btnReadPerspectiveClick(self);  
end;

procedure TFormPerspective.Exec(argFraEditor: TfraPaintBox);
begin
  fraEditor:= argFraEditor;
  self.Show;
end;

end.

