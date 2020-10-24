{author Vladyslav Mambetov}
{date 2017.10.29-11.05}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    BtnEncrypt: TBitBtn;
    BtnDecrypt: TBitBtn;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    Memo4: TMemo;
    Edit3: TEdit;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Memo5: TMemo;
    BitBtn5: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Memo1Exit(Sender: TObject);
    procedure Memo1Enter(Sender: TObject);
    procedure Memo2Enter(Sender: TObject);
    procedure Memo2Exit(Sender: TObject);
    procedure Memo3Exit(Sender: TObject);
    procedure Memo3Enter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnEncryptClick(Sender: TObject);
    procedure BtnDecryptClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FileSource: file of byte;
  FileEncrypted: file of byte;
  FileDecrypted: file of byte;
  FileKey: file of byte;
  main_index: integer;

implementation

{$R *.dfm}



procedure TForm1.Memo1Exit(Sender: TObject);
begin
  Memo1.Lines.SaveToFile('texts/source');
end;

procedure TForm1.Memo1Enter(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile('texts/source');
end;

procedure TForm1.Memo2Enter(Sender: TObject);
begin
  Memo2.Lines.LoadFromFile('texts/encrypted');
end;

procedure TForm1.Memo2Exit(Sender: TObject);
begin
  Memo2.Lines.SaveToFile('texts/encrypted');
end;

procedure TForm1.Memo3Exit(Sender: TObject);
begin
  Memo3.Lines.SaveToFile('texts/decrypted');
end;

procedure TForm1.Memo3Enter(Sender: TObject);
begin
  Memo3.Lines.LoadFromFile('texts/decrypted');
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile('texts/source');
  Memo2.Lines.LoadFromFile('texts/encrypted');
  Memo3.Lines.LoadFromFile('texts/decrypted');
  Memo4.Lines.LoadFromFile('texts/key');

  assignfile(FileSource, 'texts/source');
  assignfile(FileEncrypted, 'texts/encrypted');
  assignfile(FileDecrypted, 'texts/decrypted');
  assignfile(FileKey, 'texts/key');
end;

procedure TForm1.BtnEncryptClick(Sender: TObject);
var
  arr_byte: array [0..100] of byte;
  idx, fsizeSource: byte;
  key: byte;

begin
  {reading from file "source" to array}
  Reset(FileSource);
  fsizeSource := FileSize(FileSource) - 1;

  for idx := 0 to fsizeSource do
  begin
    Read(FileSource, arr_byte[idx]);
  end;

  CloseFile(FileSource);

  {encrypt an array}
  key := strtoint(edit1.text) mod 224;
  for idx := 0 to fsizeSource do
  begin
    if arr_byte[idx] > 31 then
      arr_byte[idx] := 32 + (arr_byte[idx] + key - 32) mod 224;
  end;

  {write from array to file "enrypted"}
  Rewrite(FileEncrypted);

  for idx := 0 to fsizeSource do
  begin
    Write(FileEncrypted, arr_byte[idx]);
  end;

  CloseFile(FileEncrypted);

  Memo2.Lines.LoadFromFile('texts/encrypted');

  Memo5.Lines.Append('Encrypte from "Source" file to "Encrypted" file.');
  inc(main_index);
  Memo5.Lines.Append('[' + inttostr(main_index) + ']Complete...');
end;

procedure TForm1.BtnDecryptClick(Sender: TObject);
var
  arr_byte: array [0..100] of byte;
  idx, fsizeEncrypted: byte;
  key: byte;

begin
  {reading from file "encrepted" to array}
  Reset(FileEncrypted);
  fsizeEncrypted := FileSize(FileEncrypted) - 1;

  for idx := 0 to fsizeEncrypted do
  begin
    Read(FileEncrypted, arr_byte[idx]);
  end;

  CloseFile(FileEncrypted);

  {encrypt an array}
  key := strtoint(edit1.text) mod 224;

  for idx := 0 to fsizeEncrypted do
  begin
    if arr_byte[idx] > 31 then
      arr_byte[idx] := 32 + (224 - key + arr_byte[idx] - 32) mod 224;
  end;

  {write from array to file "decrypted"}
  Rewrite(FileDecrypted);

  for idx := 0 to fsizeEncrypted do
  begin
    Write(FileDecrypted, arr_byte[idx]);
  end;

  CloseFile(FileDecrypted);

  Memo3.Lines.LoadFromFile('texts/decrypted');

  Memo5.Lines.Append('Decrypte from "Encrypted" file to "Decrypted" file.');
  inc(main_index);
  Memo5.Lines.Append('[' + inttostr(main_index) + ']Complete...');
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  arr_byte: array [0..100] of byte;
  idx, fsizeSource, pos, len_key: byte;
  key: string;

begin
  {reading from file "source" to array}
  Reset(FileSource);
  fsizeSource := FileSize(FileSource) - 1;

  for idx := 0 to fsizeSource do
  begin
    Read(FileSource, arr_byte[idx]);
  end;

  CloseFile(FileSource);

  {encrypt an array}
  key := edit2.text;
  pos := 0;
  len_key := length(key);

  for idx := 0 to fsizeSource do
  begin
    if arr_byte[idx] > 31 then
      arr_byte[idx] := 32 + (arr_byte[idx] + ord(key[pos + 1]) - 32) mod 224;
      pos := (pos + 1) mod len_key;
  end;

  {write from array to file "enrypted"}
  Rewrite(FileEncrypted);

  for idx := 0 to fsizeSource do
  begin
    Write(FileEncrypted, arr_byte[idx]);
  end;

  CloseFile(FileEncrypted);

  Memo2.Lines.LoadFromFile('texts/encrypted');

  Memo5.Lines.Append('Encrypte from "Source" file to "Encrypted" file.');
  inc(main_index);
  Memo5.Lines.Append('[' + inttostr(main_index) + ']Complete...');
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
  arr_byte: array [0..100] of byte;
  idx, fsizeEncrypted, pos, len_key: byte;
  key: string;

begin
  {reading from file "encrypted" to array}
  Reset(FileEncrypted);
  fsizeEncrypted := FileSize(FileEncrypted) - 1;

  for idx := 0 to fsizeEncrypted do
  begin
    Read(FileEncrypted, arr_byte[idx]);
  end;

  CloseFile(FileEncrypted);

  {encrypt an array}
  key := edit2.text;
  pos := 0;
  len_key := length(key);

  for idx := 0 to fsizeEncrypted do
  begin
    if arr_byte[idx] > 31 then
      arr_byte[idx] := 32 + (224 - ord(key[pos + 1]) + arr_byte[idx] - 32) mod 224;
      pos := (pos + 1) mod len_key;
  end;

  {write from array to file "decrypted"}
  Rewrite(FileDecrypted);

  for idx := 0 to fsizeEncrypted do
  begin
    Write(FileDecrypted, arr_byte[idx]);
  end;

  CloseFile(FileDecrypted);

  Memo3.Lines.LoadFromFile('texts/decrypted');

  Memo5.Lines.Append('Decrypte from "Encrypted" file to "Decrypted" file.');
  inc(main_index);
  Memo5.Lines.Append('[' + inttostr(main_index) + ']Complete...');
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  arr_byte: array [0..100] of byte;
  arr_key: array [0..100] of byte;
  idx, fsizeSource, fsizeKey: byte;

begin
  {reading from file "source" to array}
  Reset(FileSource);
  fsizeSource := FileSize(FileSource) - 1;

  for idx := 0 to fsizeSource do
  begin
    Read(FileSource, arr_byte[idx]);
  end;

  CloseFile(FileSource);

  {reading the key from the file "key" into an array}
  Reset(FileKey);
  fsizeKey := FileSize(FileKey) - 1;

  for idx := 0 to fsizeKey do
  begin
    Read(FileKey, arr_key[idx]);
  end;

  CloseFile(FileKey);

  {encrypt an array}
  for idx := 0 to fsizeSource do
  begin
    if arr_byte[idx] > 31 then
      arr_byte[idx] := 32 + (arr_byte[idx] + arr_key[idx] - 64) mod 224;
  end;

  {write from array to file "enrypted"}
  Rewrite(FileEncrypted);

  for idx := 0 to fsizeSource do
  begin
    Write(FileEncrypted, arr_byte[idx]);
  end;

  CloseFile(FileEncrypted);

  Memo2.Lines.LoadFromFile('texts/encrypted');

  Memo5.Lines.Append('Encrypte from "Source" file to "Encrypted" file.');
  inc(main_index);
  Memo5.Lines.Append('[' + inttostr(main_index) + ']Complete...');
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
  arr_byte: array [0..100] of byte;
  arr_key: array [0..100] of byte;
  idx, fsizeEncrypted, fsizeKey: byte;

begin
  {reading from file "encrypted" to array}
  Reset(FileEncrypted);
  fsizeEncrypted := FileSize(FileEncrypted) - 1;

  for idx := 0 to fsizeEncrypted do
  begin
    Read(FileEncrypted, arr_byte[idx]);
  end;

  CloseFile(FileEncrypted);

  {reading the key from the file "key" into an array}
  Reset(FileKey);
  fsizeKey := FileSize(FileKey) - 1;

  for idx := 0 to fsizeKey do
  begin
    Read(FileKey, arr_key[idx]);
  end;

  CloseFile(FileKey);

  {encrypt an array}
  for idx := 0 to fsizeEncrypted do
  begin
    if arr_byte[idx] > 31 then
      arr_byte[idx] := 32 + (224 - arr_key[idx] + arr_byte[idx]) mod 224;
  end;

  {write from array to file "decrypted"}
  Rewrite(FileDecrypted);

  for idx := 0 to fsizeEncrypted do
  begin
    Write(FileDecrypted, arr_byte[idx]);
  end;

  CloseFile(FileDecrypted);

  Memo3.Lines.LoadFromFile('texts/decrypted');

  Memo5.Lines.Append('Decrypte from "Encrypted" file to "Decrypted" file.');
  inc(main_index);
  Memo5.Lines.Append('[' + inttostr(main_index) + ']Complete...');
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var
  LenthText, Seed, i: integer;
  c: byte;
begin
  Seed := StrToInt(edit3.text);

  Reset(FileSource);
  LenthText := FileSize(FileSource);
  CloseFile(FileSource);

  RandSeed := LenthText * (Seed + 1);

  Rewrite(FileKey);

  for i := 1 to LenthText do
  begin
    c := 32 + random(224);
    Write(FileKey, c);
  end;

  CloseFile(FileKey);

  Memo4.Lines.LoadFromFile('texts/key');

  Memo5.Lines.Append('Generate key. Save to the "Key" file.');
  inc(main_index);
  Memo5.Lines.Append('[' + inttostr(main_index) + ']Complete...');
end;

end.
