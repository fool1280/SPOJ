const fi='';
      fo='';
var f,g:text;
    a,b,c:array[1..50000] of longint;
    m,n,k:longint;
procedure Doc;
var i,j:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,m,n,k);
        for i:=1 to m do read(f,a[i]);
        for i:=1 to n do read(f,b[i]);
        close(f);
end;
procedure Sort(l,r:longint);
var i,j,k,temp:longint;
begin
        i:=l;
        j:=r;
        k:=b[random(r-l+1)+l];
        repeat
                while b[i]<k do inc(i);
                while b[j]>k do dec(j);
                if i<=j then
                begin
                        temp:=b[i];
                        b[i]:=b[j];
                        b[j]:=temp;
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if i<r then Sort(i,r);
        if l<j then Sort(l,j);
end;
procedure Sort1(l,r:longint);
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
        if i<r then Sort1(i,r);
        if l<j then Sort1(l,j);
end;
procedure XuLi;
var i,j,r:longint;
begin
        Sort1(1,m);
        Sort(1,n);
        r:=1;
        c[r]:=a[1]+b[1];
        assign(g,fo);
        rewrite(g);
        writeln(g,c[r]);
        while r<k do
        begin
        end;
        close(g);
end;
begin
        Doc;
        XuLi;
end.
