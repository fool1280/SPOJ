const fi='';
      fo='';
var ff,g:text;
    a,f:array[1..1000] of longint;
    n:longint;
procedure Doc;
var i:longint;
begin
        assign(ff,fi);
        reset(ff);
        read(ff,n);
        for i:=1 to n do read(ff,a[i]);
        close(ff);
end;
procedure Sort (l,r:longint);
var i,j,k,temp:longint;
begin
        i:=l;
        j:=r;
        k:=a[random(r-l+1)+l];
        repeat
                while a[i]<k do inc(i);
                while a[j]>k do dec(j);
                if i<=j then
                begin
                        temp:=a[i];
                        a[i]:=a[j];
                        a[j]:=temp;
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if l<j then Sort(l,j);
        if i<r then Sort(i,r);
end;
function tknp(x:longint):longint;
var dau,giua,cuoi:longint;
begin
        dau:=1;
        cuoi:=n;
        while dau<=cuoi do
        begin
                giua:=(dau+cuoi) div 2;
                if a[giua]=x then exit(giua);
                if a[giua]<x then dau:=giua+1 else cuoi:=giua-1;
        end;
        exit(0);
end;
procedure XuLi;
var i,j,kq,vitri:longint;
begin
        for i:=1 to n do f[i]:=1;
        kq:=0;
        for i:=1 to n do
        begin
                for j:=i+1 to n do
                begin
                        vitri:=tknp(a[j]-a[i]);
                        if vitri>0 then
                        begin
                                if (vitri in [2..n]) and ((a[vitri]=a[vitri+1]) or (a[vitri]=a[vitri-1])) and (2*a[i]=a[j]) then
                                begin
                                        if f[i]+1>f[j] then f[j]:=f[i]+1;
                                end
                                else
                                if (2*a[i]<>a[j]) then
                                begin
                                        if f[i]+1>f[j] then f[j]:=f[i]+1;
                                        if f[vitri]+1>f[j] then f[j]:=f[vitri]+1;
                                end;
                        end;
                end;
        end;
        for i:=1 to n do if f[i]>kq then kq:=f[i];
        assign(g,fo);
        rewrite(g);
        write(g,kq);
        close(g);
end;
begin
        Doc;
        Sort(1,n);
        XuLi;
end.
