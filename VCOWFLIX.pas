uses math;
const fi='';
      fo='';
var a:array[1..16] of longint;
    c,n:longint;
    f,g:text;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,c,n);
        for i:=1 to n do read(f,a[i]);
        close(f);
end;
function GetBit(k,x:longint):longint;
begin
        GetBit:=(x shr (k-1)) and 1;
end;
procedure XuLi;
var j,i,kq,d:longint;
begin
        kq:=0;
        for i:=0 to (1 shl n)-1 do
        begin
                d:=0;
                for j:=1 to n do if GetBit(j,i)=1 then d:=d+a[j];
                if d<=c then kq:=max(kq,d);
        end;
        assign(g,fo);
        rewrite(g);
        writeln(g,kq);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
