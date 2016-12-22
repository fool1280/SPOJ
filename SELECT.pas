const fi='';
      fo='';
var f,g:text;
    a:array[1..4,1..10000] of longint;
    kq:array[1..10000,0..16] of int64;
    n,maxa:longint;
procedure Doc;
var i,j:longint;
begin
        assign(f,fi);
        reset(f);
        maxa:=-maxlongint;
        readln(f,n);
        for i:=1 to 4 do
        begin
                for j:=1 to n do
                begin
                        read(f,a[i,j]);
                        if a[i,j]>maxa then maxa:=a[i,j];
                end;
        end;
        close(f);
end;
function GetBit(k,x:longint):integer;
begin
        GetBit:=(x shr (k-1)) and 1;
end;
function Tinh(x,i:longint):int64;
var sum:int64;
    k:integer;
begin
        sum:=0;
        for k:=1 to 4 do
        begin
                if GetBit(k,x)=1 then
                begin
                        sum:=sum+a[k,i];
                end;
        end;
        exit(sum);
end;
function KiemTra(k:longint):boolean;
var i:longint;
begin
        for i:=1 to 3 do if (GetBit(i,k)=GetBit(i+1,k)) and (GetBit(i,k)=1) then exit(false);
        exit(true);
end;
procedure XuLi;
var i,j,k:integer;
    max,t:int64;
begin
        for i:=1 to n do
        for j:=0 to 16 do kq[i,j]:=0;
        for j:=0 to 16 do if KiemTra(j) then kq[1,j]:=Tinh(j,1);
        for i:=2 to n do
        begin
                for j:=0 to 16 do
                begin
                        for k:=0 to 16 do
                        begin
                                t:=Tinh(k,i);
                                if (j and k=0) and (kq[i-1,j]+t>kq[i,k]) and (KiemTra(k)) and (KiemTra(j)) then
                                begin
                                        kq[i,k]:=kq[i-1,j]+t;
                                end;
                        end;
                end;
        end;
        max:=-maxlongint;
        for i:=0 to 16 do
        begin
                if (KiemTra(i)) and (kq[n,i]>max) then max:=kq[n,i];
        end;
        assign(g,fo);
        rewrite(g);
        if maxa<0 then writeln(g,maxa) else writeln(g,max);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
