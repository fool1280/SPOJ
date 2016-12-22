const fi='';
      fo='';
var a:array[1..20000] of longint;
    f,g:text;
    n:longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        read(f,n);
        for i:=1 to n do read(f,a[i]);
        close(f);
end;
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
procedure XuLi;
var i,kq:longint;
begin
        Sort(1,n);
        kq:=0;
        i:=1;
        while n>1 do
        begin
                if a[i]>=n-1 then break;
                kq:=kq+a[i];
                dec(n,a[i]+1);
                inc(i);
        end;
        kq:=kq+n-1;
        assign(g,fo);
        rewrite(g);
        write(g,kq);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
