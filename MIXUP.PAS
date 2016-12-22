const fi='';
      fo='';
var f,g:text;
    a:array[1..16] of longint;
    n,s:integer;
    kq:array[1..16,0..65536] of int64;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,s);
        for i:=1 to n do read(f,a[i]);
        close(f);
end;
function GetBit(k,x:longint):longint;
begin
        GetBit:=(x shr (k-1)) and 1;
end;
function SetBit(k,x:longint):longint;
begin
        SetBit:=x and not(1 shl (k-1));
end;
procedure XuLi;
var i,j,t,x,k:longint;
    res:int64;
begin
        t:=1 shl n -1; //1111
        for i:=1 to n do
        for j:=0 to t do kq[i,j]:=0;
        for i:=0 to t do
        begin
                for j:=1 to n do
                begin
                        if GetBit(j,i)=1 then
                        begin
                                x:=SetBit(j,i);
                                if x=0 then
                                begin
                                        kq[j,i]:=1;
                                        break;
                                end;
                                for k:=1 to n do
                                begin
                                        if (GetBit(k,x)=1) and (abs(a[j]-a[k])>s) then
                                        begin
                                                kq[j,i]:=kq[k,x]+kq[j,i];
                                        end;
                                end;
                        end;
                end;
        end;
        res:=0;
        for i:=1 to n do res:=res+kq[i,t];
        assign(g,fo);
        rewrite(g);
        write(g,res);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
