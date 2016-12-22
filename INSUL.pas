const fi='';
      fo='';
var f,g:text;
    n:longint;
    a:array[1..100000] of longint;
procedure Sort(l,r:longint);
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
        if i<r then Sort(i,r);
        if l<j then Sort(l,j);
end;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n);
        for i:=1 to n do read(f,a[i]);
        Sort(1,n);
        close(f);
end;
procedure XuLi;
var i,kq:longint;
begin
        kq:=0;
        for i:=1 to (n div 2) do
        begin
                kq:=kq+(a[n-i+1]-a[i])+a[i]+a[n-i+1];
        end;
        if n mod 2<>0 then kq:=kq+a[(n div 2)+1];
        assign(g,fo);
        rewrite(g);
        write(g,kq);
        close(g);
end;
begin
        Doc;
        XuLi;
end.