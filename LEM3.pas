const fi='LEM3.INP';
      fo='LEM3.OUT';
var f,g:text;
    kq:array[0..65536,1..16] of longint;
    a:array[1..16,1..16] of longint;
    n:integer;
procedure Doc;
var i,j:integer;
begin
        assign(f,fi);
        reset(f);
        readln(f,n);
        for i:=1 to n do
        for j:=1 to n do read(f,a[i,j]);
        close(f);
end;
function GetBit(k,x:longint):integer;
begin
        GetBit:=(x shr (k-1)) and 1;
end;
function SetBit(k,x:longint):longint;
begin
        SetBit:=x and not(1 shl (k-1));
end;
procedure QHD;
var i,j,t,x,k:longint;
begin
        t:=1 shl n -1;
        for i:=0 to t do
        for j:=1 to n do kq[i,j]:=trunc(1e9);
        for i:=0 to t do
        begin
                for j:=1 to n do
                begin
                        if GetBit(j,i)=1 then
                        begin
                                x:=SetBit(j,i);
                                if x=0 then
                                begin
                                        kq[i,j]:=0;
                                        break;
                                end;
                                for k:=1 to n do
                                if (GetBit(k,x)=1) and (kq[x,k]+a[k,j]<kq[i,j]) then kq[i,j]:=kq[x,k]+a[k,j];
                        end;
                end;
        end;
        x:=maxlongint;
        for i:=1 to n do if kq[t,i]<x then x:=kq[t,i];
        assign(g,fo);
        rewrite(g);
        write(g,x);
        close(g);
end;
begin
        Doc;
        QHD;
end.
