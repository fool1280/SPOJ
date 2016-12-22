const fi='';
      fo='';
var f,g:text;
    n,m,kq:longint;
    root:array[1..1000] of longint;
    u,v,c:array[1..10000] of longint;
procedure Swap(var a,b:longint);
var temp:longint;
begin
        temp:=a;
        a:=b;
        b:=temp;
end;
procedure Sort(l,r:longint);
var i,j,k,temp:longint;
begin
        i:=l;
        j:=r;
        k:=c[random(r-l+1)+l];
        repeat
                while c[i]<k do inc(i);
                while c[j]>k do dec(j);
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
procedure XuLi;
var sc,i,r1,r2:longint;
begin
        for i:=1 to n do root[i]:=-1;
        sc:=0;
        kq:=0;
        for i:=1 to m do
        begin
                if sc=n-1 then break;
                r1:=FindRoot(u[i]);
                r2:=FindRoot(v[i]);
                if r1<>r2 then
                begin
                        Unite(r1,r2);
                        inc(sc);
                        if c[i]>kq then kq:=c[i];
                end;
        end;
        assign(g,fo);
        rewrite(g);
        write(g,kq);
        close(g);
end;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n,m);
        for i:=1 to m do read(f,u[i],v[i],c[i]);
        Sort(1,m);
        close(f);
end;
begin
        Doc;
        XuLi;
end.