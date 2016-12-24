const maxn=32;
var f:array[-1..maxn,-1..maxn] of int64;
    n,k,l,kq:int64;
    s:string;
procedure Init;
var i,j:longint;
begin
        fillchar(f,sizeof(f),0);
        f[1,1]:=1;
        f[1,0]:=1;
        f[0,0]:=1;
        for i:=2 to maxn do
        begin
                f[i,0]:=1;
                f[1,1]:=1;
                for j:=1 to i do
                f[i,j]:=f[i-1,j]+f[i-1,j-1];
        end;
end;
procedure Doc;
begin
        readln(n,k);
        s:=binstr(n,32);
        while (length(s)>1) and (s[1]='0') do delete(s,1,1);
        l:=length(s);
end;
procedure XuLi;
var i:longint;
begin
        kq:=0;
        if k=1 then inc(kq); //k=1, tinh them 0
        for i:=1 to l-1 do kq:=kq+f[i-1,k];
        for i:=2 to l do
        begin
                if s[i]='1' then kq:=kq+f[l-i,k-1] else dec(k);
                //dat s[i]=0, moi cau hinh s luc nay < n, do dai con lai la l-i, so 0 con lai la k-1
        end;
        if k=0 then inc(kq); //n thoa
        writeln(kq);
end;
begin
        Init;
        while not eof do
        begin
                Doc;
                if k>l then
                begin
                        writeln(0);
                        continue;
                end;
                XuLi;
        end;
end.


