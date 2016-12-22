const fi='';
      fo='';
var f,g:text;
    root:array[1..10000] of longint;
    n,m:longint;
    kq:qword;
    u,v,c:array[1..100000] of longint;
procedure Swap(var a,b:longint);
var temp:longint;
begin
        temp:=a;
        a:=b;
        b:=temp;
end;
procedure Sort(l,r:longint);
var i,j,k:longint;
begin
        i:=l;
        j:=r;
        k:=c[random(r-l+1)+l];
        repeat
                while c[i]>k do inc(i);
                while c[j]<k do dec(j);
                if i<=j then
                begin
                        Swap(c[i],c[j]);
                        Swap(u[i],u[j]);
                        Swap(v[i],v[j]);
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if i<r then Sort(i,r);
        if l<j then Sort(l,j);
end;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,m);
        kq:=0;
        for i:=1 to m do
        begin
                read(f,u[i],v[i],c[i]);
                kq:=kq+c[i];
        end;
        Sort(1,m);
        close(f);
end;
function FindRoot(x:longint):longint;
var i:longint;
begin
        i:=x;
        while (root[i]>0) do i:=root[i];
        exit(i);
end;
procedure Unite(r1,r2:longint);
var x:longint;
begin
        x:=root[r1]+root[r2];
        if root[r1]<root[r2] then
        begin
                root[r1]:=x;
                root[r2]:=r1;
        end
        else
        begin
                root[r2]:=x;
                root[r1]:=r2;
        end;
end;
procedure Kruskal;
var i,sc,r1,r2:longint;
begin
        for i:=1 to n do root[i]:=-1;
        sc:=0;
        for i:=1 to m do
        begin
                if sc=n-1 then break;
                r1:=FindRoot(u[i]);
                r2:=FindRoot(v[i]);
                if r1<>r2 then
                begin
                        inc(sc);
                        Unite(r1,r2);
                        kq:=kq-c[i];
                end;
        end;
        assign(g,fo);
        rewrite(g);
        write(g,kq);
        close(g);
end;
begin
        Doc;
        Kruskal;
end.
