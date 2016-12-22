const fi='';
      fo='';
var f,g:text;
    kq:array[0..25,0..25] of qword;
procedure Init;
var i,j:integer;
begin
        kq[0,0]:=1;
        for i:=1 to 25 do
        for j:=1 to 25 do kq[i,j]:=kq[i-1,j-1]+kq[i-1,j]*j;
end;
procedure Doc;
var i,t,n,k:integer;
begin
        Init;
        assign(f,fi);
        reset(f);
        assign(g,fo);
        rewrite(g);
        readln(f,t);
        for i:=1 to t do
        begin
                readln(f,n,k);
                writeln(g,kq[n,k]);
        end;
        close(g);
        close(f);
end;
begin
        Doc;
end.