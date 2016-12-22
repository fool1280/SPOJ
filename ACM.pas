const fi='';
      fo='';
var f,g:text;
    a,b:array[1..800000] of longint;
    n:longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n);
        for i:=1 to 2*n do read(f,a[i],b[i]);
        close(f);
end;
procedure Sort(l,r:longint);
var i,j,k,temp:longint;
begin
        i:=l;
        j:=r;
        temp:=random(r-l+1)+l;
        k:=a[temp]-b[temp];
        repeat
                while a[i]-b[i]<k do inc(i);
                while a[j]-b[j]>k do dec(j);
                if i<=j then
                begin
                        temp:=a[i];
                        a[i]:=a[j];
                        a[j]:=temp;
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
procedure XuLi;
var i,kq:longint;
begin
        kq:=0;
        for i:=1 to n do kq:=kq+a[i];
        for i:=n+1 to 2*n do kq:=kq+b[i];
        assign(g,fo);
        rewrite(g);
        writeln(g,kq);
        close(g);
end;
begin
        Doc;
        Sort(1,2*n);
        XuLi;
end.
